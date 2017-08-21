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

    if upload.can_calculate
      measure_ids = curr_file.get_measure_ids

      @bundle = BUNDLES[upload.year]
      @measures = @bundle.measures.top_level.in(hqmf_id: measure_ids)
      calculator = Cypress::Cat3Calculator.new(measure_ids, @bundle, upload.correlation_id)

      curr_file.record = calculator.import_cat1_file(curr_file.content)
      curr_file.save

      @calculated_results = calculator.generate_cat3
    end

    curr_file.state = :complete
    curr_file.save(validate: false)

  rescue Nokogiri::XML::SyntaxError => e
    upload.fail(e, curr_file)
  rescue => e
    upload.fail(e.message, curr_file)
    ERROR_LOG.error e.message
    ERROR_LOG.error e.backtrace.join("\n")
  end

end
