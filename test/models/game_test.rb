require_relative 'models_helper'

describe Game do

  before do
    DataMapper.auto_migrate!
  end


  describe 'validation' do

    it 'should require an app id' do
      game = Game.create(app_name: 'PAYDAY 2', coop: true)
      expect( game ).not_to be_valid
      expect( game.errors).to include(['App must not be blank'])

      game = Game.create(app_id: '1321312398', app_name: 'PAYDAY 2', coop: true)
      expect( game ).to be_valid
    end

    it 'should require an app name' do
      game = Game.create(app_id: '2321312890412', coop: true)
      expect( game ).not_to be_valid
      expect( game.errors).to include(['App name must not be blank'])

      game = Game.create(app_id: '1321312398', app_name: 'PAYDAY 2', coop: true)
      expect( game ).to be_valid
    end

  end

end