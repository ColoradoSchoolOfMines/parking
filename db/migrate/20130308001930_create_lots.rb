class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name

      t.timestamps
    end
  end
end
