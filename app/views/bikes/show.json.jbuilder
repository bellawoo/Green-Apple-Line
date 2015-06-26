json.stations @stations do |s|
  json.location s[:location]
  json.bikes_avail s[:bikes_avail]
  json.docks_avail s[:docks_avail]
  json.latitude s[:latitude]
  json.longitude s[:longitude]
end