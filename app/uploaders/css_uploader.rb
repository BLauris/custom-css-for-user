# encoding: utf-8

class CssUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.user_id}"
  end

  def filename
    [model.user_id.to_s, 'css'].join '.'
  end

end
