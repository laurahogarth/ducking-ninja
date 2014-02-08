require 'spec_helper'

describe Agent::AgentDetailsController do
  
  before do
    @agent = FactoryGirl.create(:agent)
    sign_in :agent, @agent
  end 

  describe "GET 'show'" do
    it "returns http success" do
      get 'show' 
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      expect(response).to be_success
    end
  end

  describe "PATCH 'update'" do
    it "updates the agent details and redirects to the show page" do
      ad = FactoryGirl.create(:agent_detail)
      patch 'update', :agent_detail => ad.attributes
      expect(response).to redirect_to agent_detail_path
    end 
  end

end
