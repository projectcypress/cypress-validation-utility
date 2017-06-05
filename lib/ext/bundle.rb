module HealthDataStandards
  module CQM
    class Bundle
      alias_attribute :orig_effective_date, :effective_date
      alias_attribute :orig_measure_start, :measure_period_start

      def effective_date
        if BUNDLE_PERIOD_OVERRIDES[version[0,4]]
          return BUNDLE_PERIOD_OVERRIDES[version[0,4]]['effective_date']
        else
          return orig_effective_date
        end
      end

      def measure_period_start
        if BUNDLE_PERIOD_OVERRIDES[version[0,4]]
          return BUNDLE_PERIOD_OVERRIDES[version[0,4]]['measure_period_start']
        else
          return orig_measure_start
        end
      end
    end
  end
end
