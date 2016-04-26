require "ext/artifact"
require "ext/record"
require "cypress/cat_3_calculator"

class FileProcessJob
  include SuckerPunch::Job

  def perform(upload_id, options = {})
    upload = Upload.find(upload_id)

    upload.state = :processing
    upload.save!(validate: false)

    if upload.artifact.archive?
      upload.artifact.each_file do |filename, data|
        process_single_file(filename, data, upload)
      end

      if upload.qrda_files.count == 0
         upload.fail('Uploaded Zip file contained no XML files')
         return
      end
    else
      content_string = upload.artifact.file.read
      process_single_file('', content_string, upload)
    end

    if upload.can_calculate && upload.qrda_files.all? { |file| file.errors.empty? }
      measure_ids = upload.qrda_files.collect{ |file| file.get_measure_ids }.flatten.uniq

      @bundle = BUNDLES["2016"] # TODO figure out what bundle
      @measures = @bundle.measures.top_level.in(hqmf_id: measure_ids)

      calculator = Cypress::Cat3Calculator.new(measure_ids, @bundle)

      upload.correlation_id = calculator.correlation_id
      upload.save!(validate: false)

      upload.qrda_files.each do |qrda|
        qrda.record = calculator.import_cat1_file(qrda.content)
      end

      @calculated_results = calculator.generate_cat3
    end

    upload.complete
  rescue => e
    upload.fail(e)
  end

  def process_single_file(uploaded_filename, content_string, parent_upload)
    curr_file = parent_upload.qrda_files.build(filename: uploaded_filename, 
                                               content_string: content_string, 
                                               doc_type: parent_upload.file_type, 
                                               program: parent_upload.program, 
                                               program_year: parent_upload.year)

    curr_file.process
    curr_file.save(validate: false)
  end
end
