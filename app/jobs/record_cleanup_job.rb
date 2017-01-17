class RecordCleanupJob < ActiveJob::Base
  include SuckerPunch::Job

  DEFAULT_TIME_CUTOFF = 600 # seconds, == 10 minutes

  def perform(options = {})
    time_cutoff = DEFAULT_TIME_CUTOFF

    if options[:cutoff] == :immediate
      time_cutoff = 0
    elsif options[:cutoff]
      time_cutoff = options[:cutoff]
    end

    uploads = Upload.where(:created_at.lte => Time.now - time_cutoff.seconds)
    # by default, only look for things more than 10 minutes old,
    # we dont want the job deleting things before the user actually sees them

    uploads.each do |upload|
      correlation_id = upload.correlation_id
      upload.destroy
      next unless correlation_id
      Record.where(test_id: correlation_id).destroy_all
      QME::PatientCache.where(test_id: correlation_id).destroy_all
      HealthDataStandards::CQM::QueryCache.where(test_id: correlation_id).destroy_all
    end
  end
end
