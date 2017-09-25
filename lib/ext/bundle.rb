# frozen_string_literal: true
module HealthDataStandards
  module CQM
    class Bundle
      alias_attribute :orig_effective_date, :effective_date
      alias_attribute :orig_measure_start, :measure_period_start
      @bundles = {}

      def effective_date
        return BUNDLE_PERIOD_OVERRIDES[version[0, 4]]['effective_date'] if BUNDLE_PERIOD_OVERRIDES[version[0, 4]]
        orig_effective_date
      end

      def measure_period_start
        return BUNDLE_PERIOD_OVERRIDES[version[0, 4]]['measure_period_start'] if BUNDLE_PERIOD_OVERRIDES[version[0, 4]]
        orig_measure_start
      end

      def self.bundle_available?
        POSSIBLE_BUNDLES.each do |bundle|
          # CVU defines a "bundle year" as the year before the one defined by this variable
          @bundles[bundle] ||= HealthDataStandards::CQM::Bundle.find_by(version: /^#{bundle.to_i - 1}\./)
        end

        POSSIBLE_BUNDLES.each do |bundle|
          return true if @bundles[bundle]
        end
        false
      end

      def self.[](bundle)
        bundle_available?

        @bundles[bundle]
      end
    end
  end
end
