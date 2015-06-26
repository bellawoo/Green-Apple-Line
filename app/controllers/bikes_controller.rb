class BikesController < ApplicationController
  def show
    all = HTTParty.get("https://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    @top_5 = Bike.distance params[:lat], params[:long]
    results = []

        results = []
    @top_5.each do |d|
     realtime_for_this_station = all["stations"]["station"].find { |s| s["name"] == d["location"] }
      info = {
        location: d["location"],
        bikes_avail: realtime_for_this_station["nbBikes"],
        docks_avail: realtime_for_this_station["nbEmptyDocks"],
        latitude: d["lat"],
        longitude: d["long"]
      }
      results.push info
    end
    @stations = results
  end
end
