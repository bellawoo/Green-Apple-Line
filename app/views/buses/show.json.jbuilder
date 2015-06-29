json.buses @locate do |s|
  json.arriving_at s["StopName"]
  json.route s[:route]
  json.destination s[:destination]
  json.minutes s[:minutes].to_i
  json.latitude s[:latitude].to_f
  json.longitude s[:longitude].to_f
end