require_relative '../app/uploader/image_uploader'

class Image
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :name, :type => String
  field :mime_type, :type => String
  field :size, :type => String
  field :file 
  mount_uploader :file, ImageUploader

end
