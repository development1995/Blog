class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation
  mount_uploader :avatar, AvatarUploader

  attr_accessor :password
  before_create :build_default_profile
  has_one :profile
  has_many :posts
  has_many :favourite_posts
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  self.per_page = 8
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  private

  def build_default_profile
    build_profile
    puts 'profile has been added'
  end
end


