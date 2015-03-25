require_relative 'models_helper'

describe Library do

  before do
    DataMapper.auto_migrate!
  end


  describe 'validation' do

    it 'should require a game' do
      game = Game.create(app_id: '1321312398', app_name: 'PAYDAY 2', coop: true)
      steam_user = SteamUser.create(steam_id: "1294129419240")
      library = Library.create(steam_user: steam_user)
      expect( library ).not_to be_valid
      expect( library.errors ).to include(['Game must not be blank'])

      library = Library.create(game: game, steam_user: steam_user)
      expect( library ).to be_valid
    end

    it 'should require an steam user' do
      game = Game.create(app_id: '1321312398', app_name: 'PAYDAY 2', coop: true)
      steam_user = SteamUser.create(steam_id: "1294129419240")
      library = Library.create(game: game)
      expect( library ).not_to be_valid
      expect( library.errors ).to include(['Steam user must not be blank'])

      library = Library.create(game: game, steam_user: steam_user)
      expect( library ).to be_valid
    end

  end

end