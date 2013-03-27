class AddColumnTypeToLots < ActiveRecord::Migration
  def change
    add_column :lots, :type, :string
  end
end
