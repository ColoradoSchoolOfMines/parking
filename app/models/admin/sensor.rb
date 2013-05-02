class Admin::Sensor < ActiveRecord::Base
  attr_accessible :api_token, :lot_id
  has_one :lot
end
