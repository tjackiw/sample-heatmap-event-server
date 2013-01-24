require 'heatmap'
require 'mongoid'
require_relative 'models/event'

ENV['MONGOID_ENV'] = 'development'
Mongoid.load!('config/mongoid.yml')

maps     = ["Sunken Harbor", "Orbital Comm Tower", "Blackwater Harvester", "Moisture Farm"]
query    = { map: maps[rand(maps.size)], action: 'kill' }
filename = ENV['OUTPUT'] || 'heatmap.png'

unless Event.where(query).count > 0
  puts "Not enough data to generate the heatmap, exiting..."
  exit(9)
end

heatmap  = Heatmap.new
print "Generating heatmap... "

Event.where(query).each{|event| 
  heatmap << Heatmap::Area.new(event.point_x, event.point_y, event.kills.to_i/100.0)
}

heatmap.output(filename)
puts "done. Saved to #{filename}"