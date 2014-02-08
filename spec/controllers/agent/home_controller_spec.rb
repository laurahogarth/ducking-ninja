require 'spec_helper'

describe Agent::HomeController do

  before do
    sign_in :agent, FactoryGirl.create(:agent) 
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

end
