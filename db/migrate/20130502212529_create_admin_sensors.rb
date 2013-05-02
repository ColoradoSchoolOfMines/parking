class CreateAdminSensors < ActiveRecord::Migration
  def change
    create_table :admin_sensors do |t|
      t.string :api_token
      t.integer :lot_id

      t.timestamps
    end
  end
end
