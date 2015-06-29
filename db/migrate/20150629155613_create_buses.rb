class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.integer :stop_id
      t.float :lat
      t.float :long
      t.string :stop_name
      t.string :direction
      t.string :route_id
      t.float :distance

      t.timestamps null: false
    end
  end
end
