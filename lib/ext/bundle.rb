module HealthDataStandards
  module CQM
    class Bundle
      alias_attribute :orig_effective_date, :effective_date
      alias_attribute :orig_measure_start, :measure_period_start

      def effective_date
        return BUNDLE_PERIOD_OVERRIDES[version]['effective_date'] if BUNDLE_PERIOD_OVERRIDES[version]
        orig_effective_date
      end

      def measure_period_start
        return BUNDLE_PERIOD_OVERRIDES[version]['measure_period_start'] if BUNDLE_PERIOD_OVERRIDES[version]
        orig_measure_start
      end
    end
  end
end
