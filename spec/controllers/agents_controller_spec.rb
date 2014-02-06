require 'spec_helper'

describe AgentsController do
  before do
    #Sign in an agent
    @agent = FactoryGirl.create(:agent)
    sign_in :agent, @agent
  end 

  describe "GET 'dashboard'" do
    it "returns http success" do
      get 'dashboard', id: @agent.id
      expect(response).to be_success
    end
  end

end
