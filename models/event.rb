require 'mongoid'

class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :player_id, type: Fixnum
  field :map,       type: String
  field :kills,     type: Fixnum
  field :action,    type: String
  field :point_x,   type: Fixnum
  field :point_y,   type: Fixnum
end
