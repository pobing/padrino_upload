require_relative '../app/uploader/image_uploader'
require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  include BCrypt
  # field <name>, :type => <type>, :default => <value>
  # field :name, :type => String
  # field :age, :type => Integer
  # field :email, :type => String
  # field :role, :type => String
  # field :uid, :type => String
  # field :provider, :type => String
  field :email, :type => String
  field :password_hash,:type => String
  field :ticket, :type => String
  field :ticket_expires_at, type: Time, default: 0
  field :last_signin_at,  type: Time, default: 0

  before_save :create_ticket

  # attr_accessible :image
  # field :image
  # mount_uploader :image, ImageUploader

  def password
    @password ||= Password.new(password_hash)
    end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # def self.create_with_omniauth(auth)
  #   create! do |account|
  #     account.provider = auth["provider"]
  #     account.uid      = auth["uid"]
  #     account.email    = auth["name"]
  #     account.email    = auth["user_info"]["email"] if auth["user_info"] # we get this only from FB
  #     account.role     = "users"
  #   end
  # end

  private

    def create_ticket
      self.ticket = SecureRandom.urlsafe_base64
      self.ticket_expires_at = 1.months.since
    end
end
