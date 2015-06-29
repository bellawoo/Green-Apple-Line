class Bus < ActiveRecord::Base
  Token = Figaro.env.wmata_api_key

  def self.populate_table
    response = HTTParty.get("https://api.wmata.com/Bus.svc/json/jStops", query: {api_key: "#{Token}"})
    bus_stops = response["Stops"]
    
    bus_stops.each do |b|
      self.where({
        :stop_id => b["StopID"],
        :lat => b["Lat"],
        :long => b["Lon"],
        :stop_name => b["Name"]
        }).first_or_create!
      end
  end

  def self.distance lat, long
    Bus.all.each do |b|
      distance = Haversine.distance(lat.to_f, long.to_f, b.lat, b.long).to_mi
    end
    self.closest_stops distance
  end

  def self.closest_stops distance
    buses = Bus.all.sort_by { |b| b.distance(location)}[0..3]
    @stop_id = buses[:stop_id]
    @lat = buses[:lat]
    @long = buses[:long]
    self.next_buses stop_id, lat, long
  end

  def self.next_buses stop_id, lat, long
    stop_id.each do |predictions|
    predictions = HTTParty.get("https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{stop_id}", query: {api_key: "#{Token}" })
    end

    @buses = []
    predictions.each do |d|
      info = {
        arriving_at: d["StopName"],
        route: d["Predictions"]["RouteID"],
        destination: d["Predictions"]["DestinationText"],
        minutes: d["Predictions"]["Minutes"].to_i,
        latitude: chosen_lat,
        longitude: chosen_long
      }
      @buses.push info
    end
    @buses
  end
end
