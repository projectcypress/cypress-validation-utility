# specifics helper provides general funcitonality necessary for fully
# determining specific occurrence rationale updates
module Upload::SpecificsHelper
  def create_keyed_hash(input_hash)
    output = {}
    input_hash.each do |key, val|
      output[key] = val
      output[key][:key] = key
    end
    output
  end

  def build_parent_map(root, data_crit_hash)
    parent_map = {}
    return parent_map unless root
    if root[:preconditions] && !root[:preconditions].empty?
      root[:preconditions].each do |precondition|
        parent_map["precondition_#{precondition[:id]}"] =
          (parent_map["precondition_#{precondition[:id]}"] || []).push root
        parent_map = parent_map.merge(
          build_parent_map(precondition, data_crit_hash)
        ) { |_key, oldval, newval| oldval.concat newval }
      end
    elsif root[:reference]
      parent_map[root[:reference]] =
        (parent_map[root[:reference]] || []).push root
      parent_map = parent_map.merge(
        build_parent_map(data_crit_hash[root[:reference]],
                         data_crit_hash)
      ) { |_key, oldval, newval| oldval.concat newval }
    else
      if root[:temporal_references]
        root[:temporal_references].each do |temporal_reference|
          if temporal_reference[:reference] != 'MeasurePeriod'
            parent_map[temporal_reference[:reference]] =
              (parent_map[temporal_reference[:reference]] || []).push root
            parent_map = parent_map.merge(
              build_parent_map(data_crit_hash[temporal_reference[:reference]],
                               data_crit_hash)
            ) { |_key, oldval, newval| oldval.concat newval }
          end
        end
      end
      if root[:references] # ??? check for :references in db
        root[:references].each do |reference|
          parent_map[reference[:reference]] =
            (parent_map[reference[:reference]] || []).push root
          parent_map = parent_map.merge(
            build_parent_map(data_crit_hash[reference[:reference]],
                             data_crit_hash)
          ) { |_key, oldval, newval| oldval.concat newval }
        end
      end
      if root[:children_criteria]
        root[:children_criteria].each do |child|
          parent_map[child] = (parent_map[child] || []).push root
          parent_map = parent_map.merge(
            build_parent_map(data_crit_hash[child], data_crit_hash)
          ) { |_key, oldval, newval| oldval.concat newval }
        end
      end
    end
    parent_map
  end

  ### make updates
  def updated_negated_good(updated_rationale, rationale, good_occurrence,
                           parent_map)
    parent = parent_map[good_occurrence]
    while parent
      # byebug
      # TODO: get rid of array in hash?
      if parent[0][:negation] && rationale[good_occurrence]
        updated_rationale[good_occurrence] = false
        return
      end
      parent = parent_map["precondition_#{parent[0][:id]}"]
    end
    updated_rationale
  end

  # from each leaf walk up the tree updating the logical statements
  # appropriately to false
  def update_logic_tree(updated_rationale, rationale, code, bad_occurrence,
                        or_counts, parent_map, final_specifics)
    parents = parent_map[bad_occurrence]
    update_logic_tree_children(updated_rationale, rationale, code, parents,
                               or_counts, parent_map, final_specifics)
  end

  def update_logic_tree_children(updated_rationale, rationale, code, parents,
                                 or_counts, parent_map, final_specifics)
    return updated_rationale unless parents
    parents.each do |parent|
      parent_key = if parent[:id] then "precondition_#{parent[:id]}"
                   else parent[:key] || parent[:type]
                   end

      # we are negated if the parent is negated and the parent is a
      # precondition.  If it's a data criteria, then negation is fine
      negated = parent[:negation] && parent[:id]
      # do not bubble up negated unless we have no final specifics.  If we have
      # no final specifics then we may not have positive statements to bubble up
      next unless updated_rationale[code][parent_key] != false &&
                  (!negated || final_specifics[code].empty?)
      # if this is an OR then remove a true increment since it's a bad true
      or_counts[parent_key] = or_counts[parent_key] - 1 if or_counts[parent_key]
      # if we're either an AND or we're an OR and the count is zero then switch
      # to false and move up the tree
      if (!or_counts[parent_key] || or_counts[parent_key] == 0) &&
         (!rationale[parent_key].nil? || rationale[parent_key] == true ||
         !rationale.key?(parent_key))
        updated_rationale[code][parent_key] = false if rationale[parent_key]
        updated_rationale = update_logic_tree_children(
          updated_rationale, rationale, code, parent_map[parent_key],
          or_counts, parent_map, final_specifics)
      end
    end
    updated_rationale
  end
end
