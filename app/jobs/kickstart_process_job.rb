# frozen_string_literal: true

include ActionView::Helpers::NumberHelper

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
      # pretty_file_size = number_to_human_size(upload.artifact.file_size)
      # pretty_limit = number_to_human_size(FILE_SIZE_LIMIT)
      raise "File has size of #{number_to_human_size(upload.artifact.file_size)} and file count of #{file_count} which
             exceeds upload limits of #{number_to_human_size(FILE_SIZE_LIMIT)} and #{ZIP_FILE_LIMIT} files."
    end

    upload.artifact.each_file do |filename|
      FileProcessJob.perform_later(upload_id, filename)
    end

    upload.file_count = file_count
    upload.save!(validate: false)
  rescue Nokogiri::XML::SyntaxError => e
    upload.fail(e)
  rescue StandardError => e
    upload.fail(e.message)
    ERROR_LOG.error e.message
    ERROR_LOG.error e.backtrace.join("\n")
  end
end
