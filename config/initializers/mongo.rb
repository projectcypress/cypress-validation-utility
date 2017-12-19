# frozen_string_literal: true
module QME
  if defined? Rails::Server
    patient_cache = Mongoid.default_client['patient_cache']
    patient_cache.indexes.create_one({ 'value.measure_id' => 1, 'value.sub_id' => 1, 'value.effective_date' => 1, 'value.patient_id' => 1 },
                                     'unique' => true)
  end
end
