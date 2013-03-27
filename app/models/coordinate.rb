class Coordinate < ActiveRecord::Base
  attr_accessible :order, :x, :y
  belongs_to :lots
end
