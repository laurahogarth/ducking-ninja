require 'spec_helper'

describe AgentsController do
  before do
    #Sign in an agent
    @agent = FactoryGirl.create(:agent)
    sign_in :agent, @agent
  end 

  describe "GET 'dashboard'" do
    it "returns http success if logged in as this agent" do
      get 'dashboard', id: @agent.id
      expect(response).to be_success
    end

    it "redirects you to the home page if you're trying a differnet agent's dashboard" do
      sign_out :agent
      other_agent = FactoryGirl.create(:agent)
      sign_in :agent, other_agent
      get 'dashboard', id: @agent.id
      expect(response).to redirect_to root_url
    end
  end

 

end
