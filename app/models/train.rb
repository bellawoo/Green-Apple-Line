class Train < ActiveRecord::Base
  include HTTParty

  Token = Figaro.env.wmata_api_key

  def self.closest_station lat, long
    response = HTTParty.get("https://api.wmata.com/Rail.svc/json/jStations", query: {api_key: "#{Token}" })
    metro_station = response["Stations"]
    metro_station.each do |m|
      distance_to_here = Haversine.distance(lat.to_f, long.to_f, m["Lat"], m["Lon"]).to_mi
      m["distance"] = distance_to_here
    end
    asc_stations = metro_station.sort_by { |h| h["distance"] }
    chosen_station = asc_stations.first
    next_trains chosen_station
  end

  def self.next_trains chosen_station
    code = chosen_station["Code"]
    predictions = HTTParty.get("https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{code}", query: {api_key: "#{Token}" })
    trains = predictions["Trains"] # Isolates the API into an array of train hashes

    @results = []
    trains.each do |d|
      info = {
        arriving_at: d["LocationName"],
        line: d["Line"],
        destination: d["DestinationName"],
        minutes: d["Min"].to_i,
        latitude: d["Lat"],
        longitude: d["Lon"]
      }
      @results.push info
    end
    return @results
  end
end
