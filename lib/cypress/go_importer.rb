# frozen_string_literal: true

module Cypress
  module GoImport
    def self.replace_negated_codes(patient, bundle)
      patient.dataElements.each do |de|
        select_negated_code(de, bundle) if de['negationRationale'] && de.codes.find { |c| c.codeSystem == 'NA_VALUESET' }
      end
    end

    def self.select_negated_code(data_element, bundle)
      negated_element = data_element.dataElementCodes.map { |dec| dec if dec[:codeSystem] == 'NA_VALUESET' }.first
      negated_vs = negated_element[:code]
      valueset = HealthDataStandards::SVS::ValueSet.where(oid: negated_vs, bundle_id: bundle.id)
      negated_code = { code: valueset.first.concepts.first['code'], codeSystem: valueset.first.concepts.first['code_system_name'] }
      data_element.dataElementCodes << negated_code
    end
  end
end
