class Lot < ActiveRecord::Base
  attr_accessible :name, :cars, :total_spots
  
  validates_presence_of :total_spots, :cars

  has_many :coordinates
  
end
