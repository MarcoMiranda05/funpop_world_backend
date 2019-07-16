class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }

  has_many :wishlists
  has_many :collections
  has_many :funkos, through: :collections
  has_many :funkos, through: :wishlists
end
