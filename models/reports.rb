class Reports
  include DataMapper::Resource

  property :id, Serial # Property in Database
  property :SteamUser_id, String, required: true
  property :reportedSteamUser_id, String, required: true
  property :reason, String, required: true

end