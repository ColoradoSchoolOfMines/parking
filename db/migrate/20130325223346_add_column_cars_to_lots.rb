class AddColumnCarsToLots < ActiveRecord::Migration
  def change
    add_column :lots, :cars, :integer
  end
end
