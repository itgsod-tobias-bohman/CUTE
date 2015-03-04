class App < Sinatra::Base

  require 'openid/store/filesystem'
  require 'omniauth/strategies/steam'
  require 'json'
  require 'open-uri'

  api_key = 'AC9AA39CE23FF24F3A545A0229CF5244'

  enable :sessions

  use OmniAuth::Builder do
    provider :steam, api_key, :storage => OpenID::Store::Filesystem.new('/tmp')
  end

  get '/debug' do
    session.inspect
  end

  get '/' do
    if session[:loggedInSteamUser]
      @log = true
    else
      @log = false
    end
    slim :index
  end

  get '/logout' do
    session.clear
    redirect back
  end

  get '/test' do
    id = session[:loggedInSteamUserID]
    url = "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{api_key}&steamid=#{id}&format=json"
    buffer = open(url, "UserAgent" => "Ruby-Wget").read
    result = JSON.parse(buffer)
    result.inspect
  end

  post '/auth/steam/callback' do
    @data = request.env['omniauth.auth']
    @id = @data['uid'].to_s
    session[:loggedInSteamUser] = @data['info']['nickname'].to_s
    session[:loggedInSteamUserID] = @id

    @steamuser = SteamUser.first_or_create(steam_64: @id)
    redirect back
  end

end