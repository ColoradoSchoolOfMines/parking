class AddColumnLotTypeToLots < ActiveRecord::Migration
  def change
    add_column :lots, :type_type, :string
    remove_column :lots, :type
  end
end
