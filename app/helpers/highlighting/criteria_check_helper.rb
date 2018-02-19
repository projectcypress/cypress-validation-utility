# frozen_string_literal: true
# criteria check helper provide functionality for determining whether a
# criteria should be updated based on specific occurrences
module Highlighting::CriteriaCheckHelper
  def check_criteria_for_rationale(
      final_specifics, population, rationale, data_crit_hash, pop_key)
    # get the referenced occurrences in the logic tree using original pop code
    criteria = get_data_criteria_keys(population, data_crit_hash, pop_key).uniq

    # byebug
    results = { bad: [], good: [] }
    populate_results(results, criteria, pop_key, final_specifics, rationale)
    results
  end

  def populate_results(results, criteria, pop_key, final_specifics, rationale)
    criteria.each do |criterion|
      criterion_rationale = rationale[criterion]

      # handle the case where the rationale does not contain a criteria
      if criterion_rationale.nil?
        # ERROR_LOG.error 'WARNING: data criteria ' + criterion +
        #                 ' is not contained in the rationale'
        next
      end
      add_criterion_results(results, criterion_rationale, criterion, pop_key,
                            final_specifics)
    end
  end

  def add_criterion_results(results, criterion_rationale, criterion, pop_key,
                            final_specifics)
    if criterion_rationale &&
       criterion_rationale.is_a?(Hash) &&
       criterion_rationale[:specifics] &&
       !criterion_rationale[:specifics].empty? &&
       should_switch_highlight?(criterion_rationale, pop_key, final_specifics)

      results[:bad].push(criterion)
    else
      results[:good].push(criterion)
    end
  end

  def get_data_criteria_keys(child, data_crit_hash, key = nil)
    # byebug
    occurrences = []
    return occurrences unless child
    if child[:preconditions] && !child[:preconditions].empty?
      child[:preconditions].each do |precondition|
        occurrences.concat get_data_criteria_keys(precondition, data_crit_hash)
      end
    elsif child[:reference]
      occurrences.concat get_data_criteria_keys(
        data_crit_hash[child[:reference]], data_crit_hash, child[:reference])
    else
      add_complex_occurrences(occurrences, key, child, data_crit_hash)
    end
    occurrences
  end

  def add_complex_occurrences(occurrences, key, child, data_crit_hash)
    if child[:type] == 'derived' && child[:children_criteria]
      add_derived_occurrences(occurrences, key, child, data_crit_hash)
    elsif key
      occurrences.push key
    end
    add_references_key_occurrences(
      occurrences, :temporal_references, child, data_crit_hash)
    add_references_key_occurrences(
      occurrences, :references, child, data_crit_hash)
  end

  def add_derived_occurrences(occurrences, key, child, data_crit_hash)
    # add derived to DC list if it's a satisfies all/any or a variable
    occurrences.push key if key && (child[:definition] == 'satisfies_all' ||
      child[:definition] == 'satisfies_any' || child[:variable])

    child[:children_criteria].each do |data_criteria_key|
      data_criteria = data_crit_hash[data_criteria_key]
      occurrences.concat get_data_criteria_keys(
        data_criteria, data_crit_hash, data_criteria_key)
    end
  end

  def add_references_key_occurrences(occurrences, key, child, data_crit_hash)
    if child[key] && !child[key].empty?
      # for type, reference of child.references ???
      child[key].each do |reference|
        data_criteria = data_crit_hash[reference[:reference]]
        occurrences.concat get_data_criteria_keys(
          data_criteria, data_crit_hash, reference[:reference])
      end
    end
  end

  def should_switch_highlight?(criterion_rationale, pop_key, specifics)
    # determine if final specifics indicates a "specifically false" switch

    # data criteria specifics arrays
    dc_specifics = criterion_rationale[:specifics]

    if specifics && specifics[pop_key] && !specifics[pop_key].empty?
      return pop_dc_match?(specifics, pop_key, dc_specifics)
    end

    # if there are no population specifics, check for all wildcard in any dc_arr
    # (implicit match)
    dc_specifics.each do |data_crit_spec_arr|
      # if any spec comparison matches, don't switch highlight
      return false if found_implicit_match?(data_crit_spec_arr)
    end
    # switch highlight if none match
    true
  end

  def pop_dc_match?(specifics, pop_key, dc_specifics)
    # iterate over all final specifics arrays in this population
    specifics[pop_key].each do |final_spec_arr|
      # compare to all specifics arrays for this data criteria
      dc_specifics.each do |data_crit_spec_arr|
        # if any spec comparison matches, don't switch highlight
        return false if spec_arrays_match?(final_spec_arr, data_crit_spec_arr)
      end
    end
    # if none match, switch highlight
    true
  end

  def spec_arrays_match?(fs_arr, dc_arr)
    # if each element is the same as the corresponding element (or either is
    # a wildcard) then true (spec matches)
    fs_arr.each_with_index do |fs, i|
      if i < dc_arr.length && fs != '*' && dc_arr[i] != '*' && fs != dc_arr[i]
        return false
      end
    end
    true
  end

  def found_implicit_match?(dc_arr)
    dc_arr.each do |dc_spec_item|
      return false unless dc_spec_item == '*'
    end
    true
  end
end
