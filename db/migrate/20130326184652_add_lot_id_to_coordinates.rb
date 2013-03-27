class AddLotIdToCoordinates < ActiveRecord::Migration
  def change
    add_column :coordinates, :lot_id, :integer
  end
end
