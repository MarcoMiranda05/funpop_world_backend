class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :pic_url, presence: true

  has_many :wishlists
  has_many :collections
  has_many :funkos, through: :collections
  has_many :funkos, through: :wishlists
end
