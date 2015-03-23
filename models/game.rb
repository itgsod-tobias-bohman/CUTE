class Game
  include DataMapper::Resource

  property :id, Serial
  property :app_id, String, required: true, unique: true
  property :app_name, String, required: true, unique: true
  property :coop, Boolean, default: false

end