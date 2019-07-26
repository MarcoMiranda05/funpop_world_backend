class Offer < ApplicationRecord
  belongs_to :incoming_funko, :class_name => :Collection,:foreign_key => "incoming_funko_id"
  belongs_to :outcoming_funko, :class_name => :Collection,:foreign_key => "outcoming_funko_id"  
end


