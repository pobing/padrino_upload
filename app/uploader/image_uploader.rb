require 'carrierwave'
require 'carrierwave/mongoid'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick 
  storage :file

  CarrierWave.configure do |config|
    # the Carrierwave.root was not set up in sinatra so
    config.root = "#{Dir.pwd}/public" 
  end
  
  def filename
    @name ||= Digest::MD5.hexdigest(model.id.to_s+Time.now.to_s)
    "#{@name}.#{file.extension.downcase}"
  end

  def store_dir
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
     "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extensions_white_list 
    %w(jpg jpeg gif png) 
  end 
 
  process :resize_to_limit => [720,720] 

  version :small do
    process :resize_to_fill => [20, 20]
  end

  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  version :normal do
    process :resize_to_fill => [180, 180]
  end

  version :original
end