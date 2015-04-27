class EncounterValidator
  include HealthDataStandards::Validate::BaseValidator
  include Singleton

    MP_START = Time.parse("1/1/2015 00:00:00 UTC").to_i

    def validate(file, options={})
      doc = get_document(file)
      encounter_times = doc.at_xpath("//cda:encounter/cda:effectiveTime")
      encounter_times.each do |encounter|
        low = get_time_value(encounter, "low")
        high = get_time_value(encounter, "high")
        current_time = Time.now.to_i
        if low > high
          # encounter ends before start time
        elsif low < MP_START
          # encounter starts before submission period
        elsif low > current_time || high > current_time
          # encounter occurs in the future
        end
          
      end
      []
    end

    def get_time_value(time_el, value_el)
      timestamp = time_el.at_xpath("./cda:#{value_el}@value")
      HealthDataStandards::Util::HL7Helper.timestamp_to_integer(timestamp)
    end
end