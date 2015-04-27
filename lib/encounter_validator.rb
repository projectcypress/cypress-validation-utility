class EncounterValidator
  include HealthDataStandards::Validate::BaseValidator
  include Singleton

    MP_START = Time.parse("1/1/2015 00:00:00 UTC").to_i

    def initialize
      @name = "Encounter validator"
    end

    def validate(file, options={})
      doc = get_document(file)
      encounter_times = doc.xpath("//cda:encounter/cda:effectiveTime")
      errors = []
      encounter_times.each do |encounter|
        low = get_time_value(encounter, "low")
        high = get_time_value(encounter, "high")
        current_time = Time.now.to_i
        if low > high
          # encounter ends before start time
          errors << build_error("Encounter ends before start time", encounter.parent.path, options[:file_name])
        elsif low < MP_START
          # encounter starts before submission period
          errors << build_error("Encounter starts before submission period", encounter.parent.path, options[:file_name])
        elsif low > current_time || high > current_time
          # encounter occurs in the future
          errors << build_error("Encounter occurs in the future", encounter.parent.path, options[:file_name])
        end
          
      end
      errors
    end

    def get_time_value(time_el, value_el)
      timestamp = time_el.at_xpath("./cda:#{value_el}/@value").value
      HealthDataStandards::Util::HL7Helper.timestamp_to_integer(timestamp)
    end
end
