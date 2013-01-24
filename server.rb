require 'sinatra'
require 'mongoid'

Mongoid.load!('config/mongoid.yml')
require_relative 'models/event'

post '/events'  do
  Event.create!(params[:event])
  status 200
end