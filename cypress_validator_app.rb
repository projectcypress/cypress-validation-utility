require "sinatra/base"
require "sinatra/reloader"
require "sinatra/assetpack"
require 'sass_paths'
require "sass"
require "pry"
require "health-data-standards"
# require_relative "./document_upload"


class CypressValidatorApp < Sinatra::Base
  register Sinatra::AssetPack

  configure :development do
    register Sinatra::Reloader
  end

  SassPaths.append("#{CypressValidatorApp.root}/app/css")
  

  assets do
    js :application, [
      '/js/vendor/jquery-1.11.1.min.js',
      '/js/vendor/bootstrap.js',
      '/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js',
      '/js/cypress-navigator.js',
      '/js/vendor/h5f.min.js',
      '/js/main.js'
    ]

    css :application, [
      '/css/bootstrap.css',
      '/css/bootstrap-theme.css',
      '/css/cypress_new.css',
      '/css/main.css'
    ]

    js_compression :jsmin
    css_compression :sass
  end

  helpers do

      NODE_TYPES ={ 1 => :element ,
                    2 => :attribute ,
                    3 => :text,
                    4 => :cdata,
                    5 => :ent_ref,
                    6 => :entity,
                    7 => :instruction,
                    8 => :comment,
                    9 => :document,
                    10  => :doc_type,
                    11  => :doc_frag,
                    12  => :notaion}

    def node_type(type)
      return NODE_TYPES[type]
    end

    def match_errors(upload)
      doc = upload.content
      uuid = UUID.new
      error_map = {}
      error_id = 0
      error_attributes = []
      locs = upload.errors.collect{|e| e.location}
      locs.compact!

      locs.each do |location|
        # Get rid of some funky stuff generated by schematron
        clean_location = location.gsub("[namespace-uri()='urn:hl7-org:v3']", '')
        node = doc.at_xpath(clean_location)
        if(node)
          elem = node
          if node.class == Nokogiri::XML::Attr
            error_attributes << node
            elem = node.element
          end
          elem = elem.root if node_type(elem.type) == :document
          if elem

            unless elem['error_id']

              elem['error_id']= uuid.generate.to_s
            end
            error_map[location] = elem['error_id']
          end
        end
      end

      return error_map, error_attributes
    end
  end

  def group_errors(upload)
    @upload.errors.group_by{ |err| err.validator}
  end

  get "/" do
    erb :index
  end

  post "/validate" do
    @upload = DocumentUpload.new(params[:file][:tempfile], params[:file_type])
    erb :results
  end

class DocumentUpload

  attr_reader :errors, :doc_type, :program, :content

  def initialize(file, doc_type, program=nil)
    @content = File.read(file)
    @content = Nokogiri::XML(@content)
    @doc_type = doc_type
    @program = program
    @errors = validators.inject([]) do |errors, v|
      errors.concat(v.validate(@content))
    end

  end

  private

  def validators
    return @validators if @validators

    @validators = [HealthDataStandards::Validate::CDA.instance]
    val_class = case @doc_type
    when "cat1"
      HealthDataStandards::Validate::Cat1
    when "cat3"
      HealthDataStandards::Validate::Cat3
    else
      raise "Invalid doc_type param: Must be one of (cat1, cat3)"
    end

    @validators << val_class.instance
  end

end

end
