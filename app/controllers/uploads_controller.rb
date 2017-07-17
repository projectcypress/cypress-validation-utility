require 'ext/artifact'
require 'hqmf-parser'

class UploadsController < ApplicationController
  before_action :require_bundles
  helper_method :should_switch_highlight

  def require_bundles
    BUNDLES['2016'] ||= HealthDataStandards::CQM::Bundle.find_by(version: /^2015\./)
    # 2016 is the reporting year so we have to use the 2015.x.x bundle ("2015 bundle for the 2016 program year")
    BUNDLES['2017'] ||= HealthDataStandards::CQM::Bundle.find_by(version: /^2016\./)
    BUNDLES['2018'] ||= HealthDataStandards::CQM::Bundle.find_by(version: /^2017\./)

    unless BUNDLES['2016'] || BUNDLES['2017'] || BUNDLES['2018']
      raise "Please install a 2016, 2017 or 2018 Cypress bundle in order to use the Cypress Validation Utility"
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
    File.delete(params[:file].tempfile)
    # rails 4 activejob adapter is not fully implemented
    #  wrt the run at a specific time later with sucker_punch
    # RecordCleanupJob.set(wait: 10.minutes).perform_later
    RecordCleanupJob.perform_in(600) # run the cleanup job in 10 mins (600 sec)
  end

  def show
    @upload = Upload.find(params[:id])

    redirect_to(root_path) && return unless @upload
    return unless @upload.completed?

    @bundle = BUNDLES[@upload.year]

    @files = @upload.qrda_files
  end

  def should_switch_highlight(data_key, pop_key, specifics, rationale)
    # check final specifics approach
    if specifics && specifics[pop_key]
      pop_final_specifics = []
      unless specifics[pop_key].empty?
        # first specfics entry for this population is final specifics array
        pop_final_specifics = specifics[pop_key][0]
      end
      return check_specifics(data_key, rationale, pop_final_specifics)
    end
    false
  end

  def check_specifics(data_key, rationale, pop_final_specifics)
    if rationale[data_key][:specifics] &&
       !rationale[data_key][:specifics].empty?
      # get this data criteria's specific info
      dc_specifics = rationale[data_key][:specifics][0]
      dc_specifics.each do |dc_spec|
        # find any data criteria specific entry that is not included
        # in the population final specifics
        true if (dc_spec != '*') && !pop_final_specifics.include?(dc_spec)
      end
    end
    false
  end
end
