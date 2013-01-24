require 'httparty'
require 'json'

class EventLogServer
  include HTTParty
  format :json
  base_uri 'http://localhost:4567'
end

events = (ENV['EVENTS'] || 500).to_i
maps   = ["Sunken Harbor", "Orbital Comm Tower", "Blackwater Harvester", "Moisture Farm"]

print "POSTing #{events} events... "
events.times do
  data = {
    body: {
      event: {
        action: "kill",
        player_id: rand(Time.now.to_i),
        point_x: rand(800),
        point_y: rand(800),
        map: maps[rand(maps.size)],
        kills: rand(20)
      }
    }
  }
  EventLogServer.post('/events', data)  
end
puts 'done'