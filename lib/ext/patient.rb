Patient = QDM::Patient

module QDM
  class Patient
	  include Mongoid::Document
	  field :test_id, type: BSON::ObjectId
	  field :bundle_id
	  field :measures, type: Hash
	  index test_id: 1

	  belongs_to :qrda_file

	  def calculation_results
	  	QDM::IndividualResult.where('patient_id' => id)
	  end
	end
end
