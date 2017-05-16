require 'ext/artifact'

class UploadsController < ApplicationController
  before_action :require_bundles

  def require_bundles
    BUNDLES['2016'] ||= HealthDataStandards::CQM::Bundle.find_by(version: /^2015\./)
    # 2016 is the reporting year so we have to use the 2015.x.x bundle ("2015 bundle for the 2016 program year")
    BUNDLES['2017'] ||= HealthDataStandards::CQM::Bundle.find_by(version: /^2016\./)

    unless BUNDLES['2016'] || BUNDLES['2017']
      raise 'Please install a 2016 Cypress bundle or a 2017 Cypress bundle in order to use the Cypress Validation Utility'
    end
  end

  def new
  end

  def create
    artf = Artifact.new(file: params[:file])
    file_type = params[:file_type]
    program = params[:program]
    year = params[:year]

    @upload = Upload.new(artifact: artf, file_type: file_type,
                         program: program, year: year)
    @upload.save!(validate: false)
    # TODO: rename errors on the Upload class, so we can remove this validate: false stuff

    FileProcessJob.perform_later(@upload.id.to_s)

    redirect_to upload_path(@upload)
  ensure
    params[:file].tempfile.delete()
    # rails 4 activejob adapter is not fully implemented
    #  wrt the run at a specific time later with sucker_punch
    # RecordCleanupJob.set(wait: 10.minutes).perform_later
    RecordCleanupJob.perform_in(600) # run the cleanup job in 10 mins (600 sec)
  end

  def show
    @upload = Upload.find(params[:id])

    redirect_to(root_path) && return unless @upload
    return unless @upload.completed?

    measure_ids = @upload.qrda_files.collect(&:measure_ids_from_file).flatten.uniq

    @bundle = BUNDLES[@upload.year]
    @measures = @bundle ? @bundle.measures.in(hqmf_id: measure_ids) : []

    @files = @upload.qrda_files
  end
end
