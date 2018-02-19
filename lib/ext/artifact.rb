# frozen_string_literal: true

class Artifact
  include Mongoid::Document
  include Mongoid::Timestamps

  MIME_FILE_TYPES = { 'application/zip' => :zip, 'multipart/mixed' => :zip, 'application/x-zip-compressed' => :zip,
                      'application/x-compressed' => :zip, 'multipart/x-zip' => :zip, 'application/xml' => :xml,
                      'text/xml' => :xml }.freeze

  mount_uploader :file, DocumentUploader
  belongs_to :upload, :index => true

  field :content_type, :type => String
  field :file_size, :type => Integer

  before_save :update_asset_attributes

  def archive?
    MIME_FILE_TYPES[content_type] == :zip || File.extname(file.uploaded_filename) == '.zip'
  end

  def get_file(name)
    return get_archived_file(name) if archive?
    return file.read if file.uploaded_filename == name
  end

  def get_archived_file(name)
    data = nil
    Zip::ZipFile.open(file.path) do |zipfile|
      data = zipfile.read(name)
    end
    data
  end

  def each_file(&_block)
    if archive?
      Zip::ZipFile.open(file.path) do |zipfile|
        zipfile.glob('*.xml', File::FNM_CASEFOLD | ::File::FNM_PATHNAME | ::File::FNM_DOTMATCH).each do |entry|
          yield entry.name
        end
      end
    else
      yield file.uploaded_filename
    end
  end

  def get_file_contents(filename)
    if archive?
      Zip::ZipFile.open(file.path) do |zipfile|
        zipfile.read(filename)
      end
    elsif file.uploaded_filename.eql? filename
      file.read
    end
  end

  private

  def update_asset_attributes
    return if file.blank? || !file_changed?
    self.content_type = file.file.content_type
    self.file_size = file.file.size
  end
end
