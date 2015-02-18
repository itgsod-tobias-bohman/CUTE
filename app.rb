class App < Sinatra::Base

  require 'openid/store/filesystem'
  require 'omniauth/strategies/steam'

  puts 'STEAM API KEY'               # Write your Steam API Key in field
  api_key = 'AC9AA39CE23FF24F3A545A0229CF5244' # Key can be found in Readme

  use Rack::Session::Cookie

  use OmniAuth::Builder do
    provider :steam, api_key, :storage => OpenID::Store::Filesystem.new('/tmp')
  end

  get '/' do
    slim :index
  end

  post '/auth/steam/callback' do
    @data = request.env['omniauth.auth']
    @id = @data['uid'].to_s
    @steam_name = @data['info']['nickname'].to_s

    @steamuser = SteamUser.first_or_create(steam_64: @id)
    redirect back
  end

end