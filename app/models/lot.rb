class Lot < ActiveRecord::Base
  attr_accessible :name, :cars, :total_spots, :type_type
  
  validates_presence_of :total_spots, :cars, :type_type

  has_many :coordinates
  
end
