class Lot < ActiveRecord::Base
  attr_accessible :name, :cars, :total_spots, :type_type
  
  validates_presence_of :total_spots, :cars, :type_type, :name

  before_validation :normalize_lot_color
  validate :valid_lot_color?

  has_many :coordinates

  def normalize_lot_color
      if self.type_type and self.type_type.is_a? String
          self.type_type = self.type_type.downcase
      end
  end

  def valid_lot_color?
      if ['blue', 'red', 'yellow'].include? self.type_type
          true
      else
          errors.add(:type_type, "Lot color is not valid")
          false
      end
  end
  
end
