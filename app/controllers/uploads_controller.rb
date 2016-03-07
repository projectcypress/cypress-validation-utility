require "rubygems"
require "zip/zip"

class UploadsController < ApplicationController
  before_action :require_bundles

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

      # the upload is an array of Document objects
      # so we can handle single xml --> single file or a zip --> multiple files
      @upload = []

      file_extn = File.extname(uploaded_filename).downcase

      if file_extn == ".zip"  

        Zip::ZipFile.open(uploaded_file.path) do |zipfile|
          zipfile.glob("*.xml",File::FNM_CASEFOLD|::File::FNM_PATHNAME|::File::FNM_DOTMATCH).each do |entry|
            content_string = zipfile.read(entry.name)
            @upload.push Upload.new(entry.name, content_string, params[:file_type], params[:program], params[:year])
          end
        end

        if @upload.count == 0
           flash[:notice] = "Uploaded Zip file contained no XML files"
           render template:"errors/400", status: 400 and return
        end

      else
        content_string = File.open(uploaded_file,"rb:bom|utf-8").read
        @upload.push Upload.new(uploaded_filename, content_string, params[:file_type], params[:program], params[:year]) 
      end

    rescue Nokogiri::XML::SyntaxError => e
      flash[:notice] = e.message
      render template:"errors/400", status: 400 and return
    ensure
      File.delete(params[:file].tempfile)
    end
  end
end
