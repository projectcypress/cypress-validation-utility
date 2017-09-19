# frozen_string_literal: true
require 'cypress/cat_3_calculator'

class KickstartProcessJob < ActiveJob::Base
  def perform(upload_id, _options = {})
    upload = Upload.find(upload_id)

    file_count = 0
    upload.artifact.each_file do |filename|
      file_count += 1
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
