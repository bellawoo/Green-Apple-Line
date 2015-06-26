class AddStationCodeToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :station_code, :string
  end
end
