# frozen_string_literal: true
module CypressValidationUtility
  module Validate
    class Cat3PopulationValidator
      include HealthDataStandards::Validate::BaseValidator
      include HealthDataStandards::Validate::ReportedResultExtractor
      include Singleton

      def initialize
        @name = 'Cat III Population Validator'
      end

      def validate(file, options = {})
        errors = []
        document = get_document(file)

        document.xpath(measure_entry_selector).each do |measure|
          begin
            pop_counts = {}
            measure_id = measure.at_xpath(measure_id_selector).value

            measure.xpath(population_selector_from_measure).each do |population|
              code = population.at_xpath(population_name_selector).value
              count = population.at_xpath(population_count_selector).value || 0

              pop_counts[code] = count.to_i
            end

            validate_populations(measure_id, pop_counts, errors, options)
          rescue StandardError => e
            # do nothing, if we get an exception the file is probably broken in some way
            Rails.logger.error(e)
          end
        end

        errors
      end

      def validate_populations(measure, pop, errors, options)
        file = options[:file_name]

        # proportion measures, ipp >= denom, denom >= num + denexcp + denex
        ipp = pop['IPP'] || pop['IPOP'] || 0
        denom = pop['DENOM'] || 0
        denex = pop['DENEX'] || 0
        denexcep = pop['DENEXCEP'] || 0
        num = pop['NUMER'] || 0

        if denom > ipp
          errors << build_error("Denominator value #{denom} is greater than Initial Population value #{ipp} for measure #{measure}", '/', file)
        end
        if (num + denex + denexcep) > denom
          errors << build_error("Numerator value #{num} + Denominator Exclusions value #{denex} + Denominator Exceptions value #{denexcep}"\
          " is greater than Denominator value #{denom} for measure #{measure}", '/', file)
        end

        errors.concat(validate_cv_populations(file))
      end

      def validate_cv_populations(file)
        errors = []
        # CVT measures, IPP >= MSRPOPL >= OBSERV
        msrpopl = pop['MSRPOPL'] || 0
        observ = pop['OBSERV'] || 0

        if msrpopl > ipp
          errors << build_error("Measure Population value #{msrpopl} is greater than Initial Population value #{ipp} for  "\
          "measure #{measure}", '/', file)
        end
        if observ > msrpopl
          errors << build_error("Measure observvations value #{observ} cannot be greater than Measure Population value #{msrpopl}"\
          " for measure #{measure}", '/', file)
        end
        errors
      end

      def measure_entry_selector
        '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component' \
          "/cda:section[./cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']]/cda:entry"
      end

      def measure_id_selector
        'cda:organizer/cda:id/@extension'
      end

      def population_selector_from_measure
        "cda:organizer/cda:component/cda:observation[./cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]"
      end

      def population_name_selector
        'cda:value/@code'
      end

      def population_count_selector
        "cda:entryRelationship/cda:observation[./cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']"\
        " and ./cda:code[@code='MSRAGG'] and ./cda:methodCode[@code='COUNT']]/cda:value/@value"
      end
    end
  end
end
