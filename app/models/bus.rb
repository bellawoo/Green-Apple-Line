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

  # def self.closest_stop lat, long
    
    
  # end
end
