require_relative 'models_helper'

describe Report do

  before do
    DataMapper.auto_migrate!
  end


  describe 'validation' do

    it 'should require a reporter' do
      reportee = SteamUser.create(steam_id: "1294129419240")
      report = Report.create(reportee: reportee, reason: 'Not Nice' )
      expect( report ).not_to be_valid
      expect( report.errors).to include(['Reporter must not be blank'])

      report = Report.create(reportee: reportee, reporter: reportee, reason: 'Not Nice' )
      expect( report ).to be_valid
    end

    it 'should require a reportee' do
      reporter = SteamUser.create(steam_id: "1294129419240")
      report = Report.create(reporter: reporter, reason: 'Not Nice' )
      expect( report ).not_to be_valid
      expect( report.errors).to include(['Reportee must not be blank'])

      report = Report.create(reportee: reporter, reporter: reporter, reason: 'Not Nice' )
      expect( report ).to be_valid
    end

  end

end