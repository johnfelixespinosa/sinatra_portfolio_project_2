class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, length: { minimum: 6}, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: 
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :password, length: { minimum: 6}, allow_nil: true

  #has_secure_password checks for existence of password and does confirmation

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end
end