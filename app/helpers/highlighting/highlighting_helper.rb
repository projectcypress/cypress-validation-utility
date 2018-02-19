# frozen_string_literal: true

module Highlighting::HighlightingHelper
  def specifics_rationale(measure, rationale, final_specifics)
    # byebug
    updated_rationale = {}
    update_params = {}
    update_params[:or_counts] = calculate_or_counts(measure, rationale)
    data_crit_hash = measure[:hqmf_document][:data_criteria]
    keyed_data_crit_hash = create_keyed_hash(data_crit_hash)

    measure[:population_ids].values.uniq.each do |id|
      pop_map = measure.hqmf_document[:population_criteria
        ].select { |_k, h| h[:hqmf_id] == id }
      population = pop_map.values[0]
      update_params[:code] = population[:type]
      next unless final_specifics[update_params[:code]]
      updated_rationale[update_params[:code]] = {}

      # get the referenced occurrences in the logic tree and
      # identify good/bad to update rationale
      update_params[:criteria_results] = check_criteria_for_rationale(
        final_specifics, population, rationale, data_crit_hash, update_params[:code])
      # submeasure_code = pop_map.keys[0]
      # @population.get(code)?.code || code ???

      update_params[:parent_map] = build_parent_map(population, keyed_data_crit_hash)

      updated_rationale = update_with_criteria_results(
        updated_rationale, rationale, final_specifics, update_params)
    end
    # byebug
    updated_rationale
  end

  def update_with_criteria_results(updated_rationale, rationale,
                                   final_specifics, update_params)
    # check each bad occurrence and remove highlights marking true
    update_params[:criteria_results][:bad].each do |bad_criteria|
      next unless rationale[bad_criteria]
      updated_rationale[update_params[:code]][bad_criteria] = false
      # move up the logic tree to set AND/ORs to false based on the
      # removal of the bad specific's true eval
      updated_rationale = update_logic_tree(
        updated_rationale, rationale, final_specifics, update_params, bad_criteria)
    end
    # check the good specifics with a negated parent.  If there are multiple
    # candidate specifics and one is good while the other is bad, the child
    # of the negation will evaluate to true, we want it to evaluate to false
    # since if there's a good negation then there's an occurrence for which
    # it evaluated to false
    update_params[:criteria_results][:good].each do |good_criteria|
      updated_rationale[update_params[:code]] = updated_negated_good(
        updated_rationale[update_params[:code]], rationale, good_criteria, update_params[:parent_map])
    end

    updated_rationale
  end

  def final_rationale_ref(reference)
    return nil if @population_key == 'OBSERV'
    rat_ref = nil
    if @specifics[@population_key] || @population_key == 'VAR'
      rat_ref = @rationale[reference]
      rat_ref = rat_ref[:results].count > 0 if rat_ref.is_a?(Hash)
      if @population_key != 'VAR' &&
         @updated_rationale[@population_key] &&
         @updated_rationale[@population_key].key?(reference)
        rat_ref = @updated_rationale[@population_key][reference]
      end
    end

    return 'bad-specifics' if should_star?(reference)
    rat_ref
  end

  # def logic_symbol(reference, final_rationale)
  #   return '' if(final_rationale==nil)
  #   if( @specifics[@population_key] &&
  #       @population_key != 'VAR' &&
  #       @updated_rationale[@population_key] &&
  #       @updated_rationale[@population_key].key?(reference))
  #       return '*'
  #     elsif(final_rationale)
  #       return '+'
  #     else
  #       return 'x'
  #   end
  # end

  def should_star?(reference)
    (@specifics[@population_key] &&
          @population_key != 'VAR' &&
          @updated_rationale[@population_key] &&
          @updated_rationale[@population_key].key?(reference))
  end

  def first_nested_criteria(criteria)
    # search criteria hierarchy for the "first" concrete criteria
    # that is not some other hierarchical grouping
    root_criteria = criteria
    while root_criteria[:children_criteria] &&
          (!root_criteria[:definition].include? 'satisfies')
      root_criteria = dc_access[root_criteria[:children_criteria][0]]
    end
    root_criteria
  end
end
