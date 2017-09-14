class DocumentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes

  storage :file
  process :set_content_type

  def store_dir
    "#{Rails.root}/tmp/uploads/#{model.id}"
  end

  def extension_white_list
    %w(xml zip)
  end

  def uploaded_filename
    file.filename
  end
end
