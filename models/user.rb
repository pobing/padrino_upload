class User
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :name, :type => String
  field :age, :type => Integer
  field :email, :type => String
  attr_accessible :image 
  field :image 
  mount_uploader :image, ImageUploader

end
