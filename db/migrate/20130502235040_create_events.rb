class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time
      t.integer :delta
      t.integer :lot_id

      t.timestamps
    end
  end
end
