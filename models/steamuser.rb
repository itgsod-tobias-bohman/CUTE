class SteamUser
  include DataMapper::Resource

  property :id, Serial # Property in Database
  property :steam_64, String, required: true, unique: true
  property :admin?, Boolean, default: false
  property :banned?, Boolean, default: false
  property :reports?, Integer, default: 0

end