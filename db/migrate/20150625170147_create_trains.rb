class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :arriving_at
      t.string :line
      t.string :destination
      t.string :minutes
      t.float :lat
      t.float :long
      t.float :distance

      t.timestamps null: false
    end
  end
end
