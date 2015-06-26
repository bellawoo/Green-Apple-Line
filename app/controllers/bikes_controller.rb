class BikesController < ApplicationController
  def show
    all = HTTParty.get("https://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    @top_5 = Bike.distance params[:lat], params[:long]
    results = []

    real_time_matches = @top_5.map{ |a| a["location"] } & all.map{ |b| b[0]["station"].first["name"] }

    real_time_matches.each do |d|
      info = {
        location: d["location"],
        bikes_avail: d["nbBikes"],
        docks_avail: d["nbEmptyDocks"],
        latitude: d["lat"],
        longitude: d["long"]
      }
      results.push info
    end
    @stations = results
    # @initial = Bike.new
    # @predictions = @initial.distance params[:lat], params[:long]
  end
end