module CypressValidationUtility
  module Validate
    class MeasurePeriodValidator
      include HealthDataStandards::Validate::BaseValidator

      REPORTING_PERIOD_SELECTOR = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/
                                   cda:entry/cda:act[./cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]/
                                   cda:effectiveTime"

      REPORTING_PERIOD_START = REPORTING_PERIOD_SELECTOR + "/cda:low/@value"
      REPORTING_PERIOD_END = REPORTING_PERIOD_SELECTOR + "/cda:high/@value"

      R3_DISCHARGE_SELECTOR = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[./cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]/cda:entry/cda:encounter[./cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]/cda:effectiveTime/cda:high/@value"
      R3_1_DISCHARGE_SELECTOR = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[./cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]/cda:entry/cda:act[./cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133']]/cda:entryRelationship/cda:encounter[./cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]/cda:effectiveTime/cda:high/@value"
      PROCEDURE_SELECTOR = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[./cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]/cda:entry/cda:procedure[./cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64']]/cda:effectiveTime/cda:high/@value"

      def initialize(program, program_year, doc_type)
        @name = 'Measure Period Validator'
        @program = program
        @program_year = program_year
        @doc_type = doc_type
      end

      def validate(file, options = {})
        @document = get_document(file)
        @options = options
        @errors = []
        @rp_start_node = @document.at_xpath(REPORTING_PERIOD_START)
        @rp_start = @rp_start_node.value.to_s
        @rp_end_node = @document.at_xpath(REPORTING_PERIOD_END)
        @rp_end = @rp_end_node.value.to_s

        case @program.downcase
        when 'ep'
          validate_year_measurement_period
        when 'eh'
          validate_quarters_measurement_period
        end
        validate_encounter_during_reporting_period unless @doc_type == 'cat3_r1' || @doc_type == 'cat3_r11'
        @errors
      rescue => e
        @errors << build_error('Unable to locate reporting period in document.', '/', @options[:file_name])
      end

      def validate_year_measurement_period
        validate_year_start
        validate_year_end
      end

      def validate_year_start
        measure_start = @program_year + '0101'
        unless @rp_start.start_with? measure_start
          msg = "Reported Measurement Period should start on #{measure_start}"
          @errors << build_error(msg, @rp_start_node.parent.path, @options[:file_name])
        end
      end

      def validate_year_end
        measure_end = @program_year + '1231'
        unless @rp_end.start_with? measure_end
          msg = "Reported Measurement Period should end on #{measure_end}"
          @errors << build_error(msg, @rp_end_node.parent.path, @options[:file_name])
        end
      end

      def validate_quarters_measurement_period
        quarters = [['0101','0331'],['0401','0630'],['0701','0930'],['1001','1231']]

        matches_quarter = false

        quarters.each do |quarter|
          measure_start = @program_year + quarter[0]
          measure_end = @program_year + quarter[1]

          if @rp_start.start_with?(measure_start) && @rp_end.start_with?(measure_end)
            matches_quarter = true
            break
          end
        end

        unless matches_quarter
          msg = "Reported Measurement Period (#{@rp_start} - #{@rp_end}) does not align to a quarter (ex, 1/1-3/31, 4/1-6/30, 7/1-9/30, 10/1-12/31)."
          @errors << build_error(msg, '/', @options[:file_name])
        end
      end

      def validate_encounter_during_reporting_period
        # pick all the discharge dates and make sure at least one falls within the reporting period
        discharge_dates = @document.xpath(R3_DISCHARGE_SELECTOR).collect(&:value)
        discharge_dates += @document.xpath(R3_1_DISCHARGE_SELECTOR).collect(&:value)
        discharge_dates += @document.xpath(PROCEDURE_SELECTOR).collect(&:value)

        # it looks like DateTime.parse is smart enough to figure out the date format, ex "20110706122735-0800" -> "Wed, 06 Jul 2011 12:27:35 -0800"
        rp_start_date = DateTime.parse(@rp_start)
        rp_end_date = DateTime.parse(@rp_end)
        rp_start_date.change({ hour: 0, min: 0, sec: 0})
        rp_end_date.change({ hour: 23, min: 59, sec: 59})

        any_date_within_period = false

        discharge_dates.each do |discharge|
          discharge_date = DateTime.parse(discharge)

          if rp_start_date <= discharge_date && discharge_date <= rp_end_date
            any_date_within_period = true
            break
          end
        end

        unless any_date_within_period
          msg = 'Documents must contain at least one encounter or procedure with a discharge date during the reporting period'
          @errors << build_error(msg, '/', @options[:file_name])
        end
      end
    end
  end
end
