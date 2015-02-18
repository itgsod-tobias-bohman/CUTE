class SteamUser
  include DataMapper::Resource

  property :id, Serial # Property in Database
  property :steam_64, String, required: true, unique: true

end