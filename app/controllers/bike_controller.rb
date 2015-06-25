class BikeController < ApplicationController
  def show
    all = HTTParty.get("https://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    @top_5 = Bike.distance params[:lat], params[:long]
    results = []
    
    @top_5.each do |d|
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