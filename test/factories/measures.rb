# frozen_string_literal: true

FactoryBot.define do
  factory :measure, class: HealthDataStandards::CQM::Measure do
    entry = Rails.root.join('test', 'fixtures', 'artifacts', 'cms127v7.json')
    transient do
      seq_id { 1 }
    end
    source_measure = JSON.parse(File.read(entry), max_nesting: 100)

    factory  :static_measure do
      name { 'Static Measure' }
      cms_id { source_measure['cms_id'] }
      hqmf_id { '40280382-6258-7581-0162-92877E281530' }
      hqmf_set_id { '59657B9B-01BF-4979-A090-8534DA1D0516' }

      continuous_variable { source_measure['continuous_variable'] }
      category { 'static' }
      type { 'ep' }
      sub_id { 'a' }

      episode_of_care { source_measure['episode_of_care'] }
      hqmf_document { source_measure['hqmf_document'] }
      source_data_criteria { source_measure['source_data_criteria'] }
      population_criteria { source_measure['population_criteria'] }
      populations { source_measure['populations'] }
      measure_period { source_measure['measure_period'] }
      oids { source_measure['oids'] }
      population_ids { source_measure['population_ids'] }
    end
  end
end
