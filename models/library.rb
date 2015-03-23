class Library
  include DataMapper::Resource

  property :id, Serial

  belongs_to :game, 'Game'
  belongs_to :steam_user, 'SteamUser'

end