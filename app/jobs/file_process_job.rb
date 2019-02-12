# frozen_string_literal: true

require 'cypress/cat_3_calculator'

class FileProcessJob < ActiveJob::Base
  def perform(upload_id, filename, _options = {})
    upload = Upload.find(upload_id)

    data = upload.artifact.get_file_contents(filename)

    curr_file = upload.qrda_files.build(filename: filename,
                                        content_string: data,
                                        doc_type: upload.file_type,
                                        program: upload.program,
                                        program_year: upload.year)

    curr_file.state = :processing
    curr_file.process
    curr_file.save(validate: false)

    curr_file.record = calculate_upload(upload, curr_file) if upload.can_calculate

    curr_file.state = :complete
    curr_file.save(validate: false)
  rescue Nokogiri::XML::SyntaxError => e
    upload.fail(e, curr_file)
  rescue StandardError => e
    upload.fail(e.message, curr_file)
    ERROR_LOG.error e.message
    ERROR_LOG.error e.backtrace.join("\n")
  end

  def calculate_upload(upload, curr_file)
    measure_ids = curr_file.measure_ids_from_file

    @bundle = HealthDataStandards::CQM::Bundle[upload.year]
    @measures = @bundle.measures.top_level.in(hqmf_id: measure_ids)
    calculator = Cypress::Cat3Calculator.new(measure_ids, @bundle, BSON::ObjectId.new)

    rec = calculator.import_cat1_file(curr_file.content)

    @calculated_results = calculator.generate_cat3

    rec
  end
end
