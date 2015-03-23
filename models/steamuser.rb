class SteamUser
  include DataMapper::Resource

  property :id, Serial
  property :steam_id, String, required: true, unique: true
  property :admin, Boolean, default: false
  property :banned, Boolean, default: false

end