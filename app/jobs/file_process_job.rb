# frozen_string_literal: true

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

    curr_file.patient = calculate_upload(upload, curr_file) if upload.can_calculate

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
    @measures = @bundle.measures.in(hqmf_id: measure_ids)

    patient = parse_and_save_record(curr_file.content)
    calc_job = Cypress::JsEcqmCalc.new('correlation_id': upload.id.to_s,
                                       'effective_date': Time.at(@bundle.effective_date).in_time_zone.to_formatted_s(:number))
    calc_job.sync_job([patient.id.to_s], @measures.map { |mes| mes._id.to_s })
    calc_job.stop
    patient
  end

  def parse_and_save_record(doc)
    patient = QRDA::Cat1::PatientImporter.instance.parse_cat1(doc)
    Cypress::GoImport.replace_negated_codes(patient, @bundle)
    patient.save
    patient
  end
end
