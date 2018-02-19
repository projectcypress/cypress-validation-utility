# frozen_string_literal: true

class EncounterValidator
  include HealthDataStandards::Validate::BaseValidator
  include Singleton

  MP_START = Time.parse('1/1/2015 00:00:00 UTC').to_i

  def initialize
    @name = 'Encounter validator'
  end

  def validate(file, options = {})
    doc = get_document(file)
    encounter_times = doc.xpath("//cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']/cda:effectiveTime")
    errors = []
    encounter_times.each do |encounter|
      begin
        low, errors = validate_encounter_time('low', 'start', encounter, options[:file_name], errors)
        high, errors = validate_encounter_time('high', 'end', encounter, options[:file_name], errors)
      rescue
        next
      end
      errors.concat validate_encounter_start_end(encounter.path, low, high, options[:file_name])
    end
    errors
  end

  def validate_encounter_time(type, title, encounter, file, errors)
    begin
      val, errors = get_time_value(encounter, type, file, errors)
    rescue ArgumentError => ae
      errors << build_error("Encounter #{title} time invalid. #{ae.message}", encounter.path, file)
      throw ae
    rescue NoMethodError
      unless encounter.at_xpath('./cda:low/@nullFlavor')
        errors << build_error("No encounter #{title} time found.", encounter.path, file)
      end
      throw ae
    end
    [val, errors]
  end

  def validate_encounter_start_end(path, low, high, file)
    errors = []
    current_time = Time.now.to_i
    if low > high
      # encounter ends before start time
      errors << build_error("Encounter ends (#{format_time(high)}) before start time (#{format_time(low)})",
                            path, file)
    elsif low > current_time || high > current_time
      # encounter occurs in the future
      errors << build_error("Encounter occurs in the future (#{format_time(low)})", path, file)
    end
    errors
  end

  def format_time(time_i)
    time = Time.at(time_i).utc
    time.strftime('%-m/%-d/%Y %k:%M')
  end

  def get_time_value(time_el, value_el, file, errors)
    timestamp = time_el.at_xpath("./cda:#{value_el}/@value").value
    if timestamp.length != 19 && timestamp.length != 14
      case value_el
      when 'low'
        errors << build_error("CMS_0075 - Fails validation check for Encounter Performed Admission Date (effectiveTime/low value)
          as specified in Table 14: Valid Date/Time Format for HQR.", time_el.path, file)
      when 'high'
        errors << build_error("CMS_0076 - Fails validation check for Encounter Performed Discharge Date (effectiveTime/high value)
          as specified in Table 14: Valid Date/Time Format for HQR.", time_el.path, file)
      end
    end
    [HealthDataStandards::Util::HL7Helper.timestamp_to_integer(timestamp), errors]
  end
end
