# frozen_string_literal: true

require 'cypress/cat_3_calculator'

class KickstartProcessJob < ActiveJob::Base
  def perform(upload_id, _options = {})
    upload = Upload.find(upload_id)

    file_count = 0
    upload.artifact.each_file do
      # count files first
      file_count += 1
    end

    if file_count > ZIP_FILE_LIMIT || upload.artifact.file_size > FILE_SIZE_LIMIT
      # limits exceeded
      raise "File has size #{upload.artifact.file_size} and file count #{file_count} which
             exceeds upload limits of #{FILE_SIZE_LIMIT} bytes and #{ZIP_FILE_LIMIT} files."
    end

    upload.artifact.each_file do |filename|
      FileProcessJob.perform_later(upload_id, filename)
    end

    upload.file_count = file_count
    upload.save!(validate: false)
  rescue Nokogiri::XML::SyntaxError => e
    upload.fail(e)
  rescue => e
    upload.fail(e.message)
    ERROR_LOG.error e.message
    ERROR_LOG.error e.backtrace.join("\n")
  end
end
