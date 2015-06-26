json.trains @results do |s|
  json.arriving_at s["LocationName"]
  json.line s["Line"]
  json.destination s["DestinationName"]
  json.minutes s["Min"].to_i
  json.latitude s["Lat"].to_f
  json.longitude s["Lon"].to_f
end