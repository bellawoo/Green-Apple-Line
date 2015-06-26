class Bike < ActiveRecord::Base

  def self.populate_table
    response = HTTParty.get("https://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    docking_stations = response["stations"]["station"]

    docking_stations.each do |s|
      self.where({
        :location => s["name"],
        :lat => s["lat"],
        :long => s["long"]
        }).first_or_create!
    end
  end

  def self.distance lat, long
    Bike.all.each do |s|
      distance_to_here = Haversine.distance(lat.to_f, long.to_f, s.lat, s.long).to_mi
      s[:distance] = distance_to_here
      s.save!
    end
    Bike.all.min_by(5) { |s| s[:distance] }
  end
end
