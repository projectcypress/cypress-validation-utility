# frozen_string_literal: true

# or count helper searches through a measure's logic tree to count branch
# points that could be flipped by a specific occurrence change
module Upload::OrCountHelper
  # Or counts are used to know when to turn an OR from green to red.
  # Once we negate all the true ors, we can switch to red
  def calculate_or_counts(measure, rationale)
    # byebug
    or_counts = {}
    measure[:population_ids].values.uniq.each do |id|
      # byebug
      pop_map = measure.hqmf_document[
        :population_criteria].select { |_k, h| h[:hqmf_id] == id }
      population = pop_map.values[0]

      or_counts = or_counts.merge(
        calculate_or_counts_recursive(rationale, population[:preconditions])
      )
    end
    or_counts.merge(calculate_data_criteria_or_counts(measure, rationale))
  end

  # recursively walk preconditions to count true values for child ORs moving
  # down the tree
  def calculate_or_counts_recursive(rationale, preconditions)
    or_counts = {}
    return or_counts if preconditions.blank?

    preconditions.each do |precondition|
      calculate_precondition_or_counts(or_counts, rationale, precondition)
      or_counts = or_counts.merge calculate_or_counts_recursive(
        rationale, precondition[:preconditions]
      )
    end
    or_counts
  end

  def calculate_precondition_or_counts(or_counts, rationale, precondition)
    if precondition[:conjunction_code] == 'atLeastOneTrue' &&
       !precondition[:negation]
      true_count = 0
      if precondition[:preconditions].present?
        precondition[:preconditions].each do |child|
          has_children = child[:preconditions].present?
          key = has_children ? "precondition_#{child[:id]}" : child[:reference]
          true_count += 1 if rationale[key]
        end
      end
      or_counts["precondition_#{precondition[:id]}"] = true_count
    end
  end

  # walk through data criteria to account for specific occurrences in a UNION
  def calculate_data_criteria_or_counts(measure, rationale)
    or_counts = {}
    measure[:hqmf_document][:data_criteria].each do |key, dc|
      next unless dc[:derivation_operator] == 'UNION' &&
                  (key.include?('UNION') || key.include?('satisfiesAny'))

      dc[:children_criteria].each do |child|
        # Only add to orCount for logically true branches
        or_counts[key] = (or_counts[key] || 0) + 1 if rationale[child]
      end
    end
    or_counts
  end
end
