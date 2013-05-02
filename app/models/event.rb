class Event < ActiveRecord::Base
  attr_accessible :delta, :lot_id, :time
end
