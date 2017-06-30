class EncounterValidator
  include HealthDataStandards::Validate::BaseValidator
  include Singleton

  MP_START = Time.parse('1/1/2015 00:00:00 UTC').to_i

  def initialize
    @name = 'Encounter validator'
  end

  # rubocop:disable MethodLength
  def validate(file, options = {})
    doc = get_document(file)
    encounter_times = doc.xpath("//cda:entry/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']/cda:effectiveTime")
    errors = []
    encounter_times.each do |encounter|
      begin
        low = get_time_value(encounter, 'low')
      rescue ArgumentError => ae
        errors << build_error("Encounter start time invalid. #{ae.message}", encounter.path, options[:file_name])
        next
      rescue NoMethodError
        unless encounter.at_xpath('./cda:low/@nullFlavor')
          errors << build_error('No encounter start time found.', encounter.path, options[:file_name])
        end
        next
      end
      begin
        high = get_time_value(encounter, 'high')
      rescue ArgumentError => ae
        errors << build_error("Encounter end time invalid. #{ae.message}", encounter.path, options[:file_name])
        next
      rescue NoMethodError
        unless encounter.at_xpath('./cda:high/@nullFlavor')
          errors << build_error('No encounter end time found.', encounter.path, options[:file_name])
        end
        next
      end
      validate_time(low, high, errors, encounter.parent.path, options[:file_name])
    end
    errors
  end

  def validate_time(low, high, errors, path, file_name)
    current_time = Time.now.to_i
    if low > high
      # encounter ends before start time
      errors << build_error("Encounter ends (#{format_time(high)}) before start time (#{format_time(low)})", path, file_name)
    elsif low > current_time || high > current_time
      # encounter occurs in the future
      errors << build_error("Encounter occurs in the future (#{format_time(low)})", path, file_name)
    end
  end

  def format_time(time_i)
    time = Time.at(time_i).utc
    time.strftime('%-m/%-d/%Y %k:%M')
  end

  def get_time_value(time_el, value_el)
    timestamp = time_el.at_xpath("./cda:#{value_el}/@value").value
    HealthDataStandards::Util::HL7Helper.timestamp_to_integer(timestamp)
  end
end
