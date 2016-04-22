require "rubygems"
require "zip/zip"
require "cypress/cat_3_calculator"
require "ext/record"

class UploadsController < ApplicationController
  before_action :require_bundles
  after_action :clean_up, only: :create

  def require_bundles
    unless BUNDLES["2016"]
      raise "Please install a 2016 Cypress bundle in order to use the Cypress Validation Utility"
    end
  end

  def new
  end

  def create
    begin
      uploaded_file = params[:file].tempfile
      uploaded_filename = params[:file].original_filename

      should_calculate = params[:file_type] == "cat1_r2" || params[:file_type] == "cat1_r3"

      # the upload is an array of Document objects
      # so we can handle single xml --> single file or a zip --> multiple files
      @upload = []

      @measure_ids = []

      file_extn = File.extname(uploaded_filename).downcase

      if file_extn == ".zip"

        Zip::ZipFile.open(uploaded_file.path) do |zipfile|
          zipfile.glob("*.xml",File::FNM_CASEFOLD|::File::FNM_PATHNAME|::File::FNM_DOTMATCH).each do |entry|
            content_string = zipfile.read(entry.name)
            process_single_file(entry.name, content_string)
          end
        end
        if @upload.count == 0
           flash[:notice] = "Uploaded Zip file contained no XML files"
           render template:"errors/400", status: 400 and return
        end
      else
        content_string = File.open(uploaded_file,"rb:bom|utf-8").read
        process_single_file(uploaded_filename, content_string)
      end

      if should_calculate
        @bundle = BUNDLES["2016"]
        @measures = @bundle.measures.top_level.in(hqmf_id: @measure_ids)

        @calculator = Cypress::Cat3Calculator.new(@measure_ids,@bundle)
        @correlation_id = @calculator.correlation_id

        @upload.each do |upl|
          upl.record = @calculator.import_cat1_file(upl.content)
        end

        @calculated_results = @calculator.generate_cat3
        @records = Record.where(test_id: @correlation_id)
      end

    rescue Nokogiri::XML::SyntaxError => e
      flash[:notice] = e.message
      render template:"errors/400", status: 400 and return
    ensure
      File.delete(params[:file].tempfile)
    end
  end

  def process_single_file(uploaded_filename, content_string)
    curr_file = Upload.new(uploaded_filename, content_string, params[:file_type], params[:program], params[:year]) 
    @measure_ids.concat curr_file.get_measure_ids
    @upload.push curr_file
  end

  def clean_up
    if @correlation_id
      Record.where(test_id: @correlation_id).destroy_all
      QME::PatientCache.where(test_id: @correlation_id).destroy_all
      HealthDataStandards::CQM::QueryCache.where(test_id: @correlation_id).destroy_all
    end
  end
end
