# The Record model is an extension of Record as defined by HealthDataStandards.

class Record
  include Mongoid::Document
  field :test_id, type: BSON::ObjectId
  field :bundle_id
  field :measures, type: Hash
  index test_id: 1

  belongs_to :qrda_file

  def calculation_results
    HealthDataStandards::CQM::PatientCache.where('value.patient_id' => id).where('value.IPP'.to_sym.gt => 0)
  end
end
