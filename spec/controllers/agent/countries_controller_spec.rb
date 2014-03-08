require 'spec_helper'

describe Agent::CountriesController do
  before :each do
    #Sign in a traveller, create them a 
    sign_in :agent, FactoryGirl.create(:agent)
  end 

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'holidays'" do
    before do
      @country = FactoryGirl.create(:country)
    end
    it "returns http success" do
      get 'holidays', id: @country
      expect(response).to be_success
    end
  end

end
