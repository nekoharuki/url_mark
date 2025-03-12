class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    process resize_to_fit: [50, 50]
  end

  def store_dir
    "url_mark/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
