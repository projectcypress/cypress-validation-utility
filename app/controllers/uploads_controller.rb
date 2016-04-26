require 'ext/artifact'

class UploadsController < ApplicationController
  before_action :require_bundles

  def require_bundles
    unless BUNDLES["2016"]
      raise "Please install a 2016 Cypress bundle in order to use the Cypress Validation Utility"
    end
  end

  def new
  end

  def create
    begin
      artf = Artifact.new(file: params[:file])
      file_type = params[:file_type]
      program = params[:program] || 'none'
      year = params[:year]

      @upload = Upload.new(artifact: artf, file_type: file_type, 
                           program: program, year: year)
      @upload.save!(validate: false)
      # TODO: rename errors on the Upload class, so we can remove this validate: false stuff

      FileProcessJob.perform_async(@upload.id.to_s)

      redirect_to upload_path(@upload)
    ensure
      File.delete(params[:file].tempfile)
      RecordCleanupJob.perform_in(600) # run the cleanup job in 10 mins (600 sec)
    end
  end

  def show
    @upload = Upload.find(params[:id])

    redirect_to(root_path) and return unless @upload
    return unless @upload.completed?

    measure_ids = @upload.qrda_files.collect{ |file| file.get_measure_ids }.flatten.uniq

    @bundle = BUNDLES["2016"] # TODO pick the bundle by measure ids
    @measures = @bundle.measures.top_level.in(hqmf_id: measure_ids)

    @files = @upload.qrda_files
  end
end
