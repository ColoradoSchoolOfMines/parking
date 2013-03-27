class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.integer :order
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
