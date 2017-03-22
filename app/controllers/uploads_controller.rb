require 'ext/artifact'
require 'hqmf-parser'

class UploadsController < ApplicationController
  before_action :require_bundles
  helper_method :shouldSwitchHighlight

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
    begin
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
  end

  def show
    @upload = Upload.find(params[:id])

    redirect_to(root_path) and return unless @upload
    return unless @upload.completed?

    @bundle = BUNDLES[@upload.year]

    @files = @upload.qrda_files
  end

  def shouldSwitchHighlight (dataCriteriaKey, populationCriteriaKey, specifics, rationale)
    #check final specifics approach
    shouldSwitch = false

    if (specifics && specifics[populationCriteriaKey])
      pop_final_specifics = []
      if (specifics[populationCriteriaKey].length > 0)
        pop_final_specifics = specifics[populationCriteriaKey][0]
      end

      if rationale[dataCriteriaKey][:specifics] && (rationale[dataCriteriaKey][:specifics].length >0)
        dc_specifics = rationale[dataCriteriaKey][:specifics][0]

        dc_specifics.each do |dc_spec|
          if (dc_spec != "*") && !pop_final_specifics.include?(dc_spec)
            return true
          end
        end
      end
    end

    return false
  end
end
