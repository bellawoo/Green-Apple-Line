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
    end
    closest_docks = Bike.all.min_by(5) { |s| s[:distance] }
    self.dock_status closest_docks
  end

  def self.dock_status closest_docks
    all = HTTParty.get("https://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    @top_5 = Bike.distance params[:lat], params[:long]

    @stations = []
    @top_5.each do |d|
     realtime_for_this_station = all["stations"]["station"].find { |s| s["name"] == d["location"] }
      info = {
        location: d["location"],
        bikes_avail: realtime_for_this_station["nbBikes"],
        docks_avail: realtime_for_this_station["nbEmptyDocks"],
        latitude: d["lat"],
        longitude: d["long"]
      }
      @stations.push info
    end
    @stations
  end
end
