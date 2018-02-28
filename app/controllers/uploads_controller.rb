# frozen_string_literal: true
require 'ext/artifact'
require 'hqmf-parser'
require 'sharedcypress'

class UploadsController < ApplicationController
  before_action :require_bundles

  def require_bundles
    unless HealthDataStandards::CQM::Bundle.bundle_available?
      raise 'Please install a 2016, 2017 or 2018 Cypress bundle in order to use the Cypress Validation Utility'
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

    KickstartProcessJob.perform_later(@upload.id.to_s)

    redirect_to upload_path(@upload)
  ensure
    params[:file].tempfile.delete
    # rails 4 activejob adapter is not fully implemented
    #  wrt the run at a specific time later with sucker_punch
    # RecordCleanupJob.set(wait: 10.minutes).perform_later
    RecordCleanupJob.perform_in(1.hour)
  end

  def show
    @upload = Upload.find(params[:id])

    redirect_to(root_path) && return unless @upload

    # If you do not convert this to an array then it will return a mongo query instead of
    # a collection of elements.
    @files = @upload.qrda_files.where(:state => :complete).to_a

    @upload_complete = (@files&.count == @upload.file_count)

    return unless @upload_complete

    @bundle = HealthDataStandards::CQM::Bundle[@upload.year]
  end
end
