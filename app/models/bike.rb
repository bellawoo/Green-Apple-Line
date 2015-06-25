class Bike < ActiveRecord::Base
  include HTTParty
  base_uri 'https://www.capitalbikeshare.com/data/stations/bikeStations.xml'

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

  # def distance lat, long
  #   response = HTTParty.get("https://www.capitalbikeshare.com/data/stations/bikeStations.xml")
  #   docking_stations = response["stations"]["station"]
    
  #   docking_stations.each do |s|
  #     distance_to_here = Haversine.distance(lat.to_f, long.to_f, s["lat"].to_f, s["long"].to_f).to_mi
  #     s["distance"] = distance_to_here
  #   end
  #   top_5 = docking_stations.min_by(5) { |s| s["distance"] } 
  #   details top_5
  # end

  # def details top_5
  #   results = []
  #   top_5.each do |d|
  #     info = {
  #       location: d["name"],
  #       bikes_avail: d["nbBikes"],
  #       docks_avail: d["nbEmptyDocks"]
  #     }
  #     results.push info
  #   end
  #  return results.to_json
  # end

end
