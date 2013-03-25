class AddColumnTotalSpotsToLots < ActiveRecord::Migration
  def change
    add_column :lots, :total_spots, :integer
  end
end
