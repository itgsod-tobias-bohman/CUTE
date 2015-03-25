require_relative 'models_helper'

describe SteamUser do

  before do
    DataMapper.auto_migrate!
  end


  describe 'validation' do

    it 'should require a steam id' do
      steamuser = SteamUser.create()
      expect( steamuser ).not_to be_valid
      expect( steamuser.errors).to include(['Steam must not be blank'])

      steamuser = SteamUser.create(steam_id: '213192124941')
      expect( steamuser ).to be_valid
    end

  end

end