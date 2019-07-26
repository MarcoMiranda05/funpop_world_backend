class Collection < ApplicationRecord
  belongs_to :funko
  belongs_to :user
  has_many :offers
end
