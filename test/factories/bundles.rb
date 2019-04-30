# frozen_string_literal: true

FactoryBot.define do
  factory :bundle, class: HealthDataStandards::CQM::Bundle do
    source_measure = JSON.parse(File.read(Rails.root.join('test', 'fixtures', 'artifacts', 'cms127v7.json')), max_nesting: 100)
    version { '2018.0.1' }

    after(:create) do |bundle|
      # Include 40 valuesets
      40.times do |count|
        create(:value_set, seq_id: count, bundle: bundle)
      end

      # Always include a complete measure (BE65090C-EB1F-11E7-8C3F-9A214CF093AE)
      measure = create(:static_measure)
      measure['bundle_id'] = bundle.id
      measure['value_set_oid_version_objects'] = source_measure['value_set_oid_version_objects']
      measure['elm_annotations'] = source_measure['elm_annotations']
      measure['observations'] = source_measure['observations']
      measure['elm'] = source_measure['elm']
      measure['main_cql_library'] = source_measure['main_cql_library']
      measure['cql_statement_dependencies'] = source_measure['cql_statement_dependencies']
      measure['populations_cql_map'] = source_measure['populations_cql_map']

      # TODO: find object ids for all of the oids in the measure
      valueset_id_list = []
      measure['value_set_oid_version_objects'].each do |vsv|
        valueset_id_list << HealthDataStandards::SVS::ValueSet.where(oid: vsv['oid'], version: vsv['version']).first.id
      end
      measure['value_sets'] = valueset_id_list
      measure.save
    end
  end
end
