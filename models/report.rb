class Report
  include DataMapper::Resource

  property :id, Serial
  property :reason, String, required: true

  belongs_to :reportee, 'SteamUser'
  belongs_to :reporter, 'SteamUser'

end