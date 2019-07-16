class Funko < ApplicationRecord
  has_many :wishlists
  has_many :collections
  has_many :users, through: :collections
  has_many :users, through: :wishlists
end
