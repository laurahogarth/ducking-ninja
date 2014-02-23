require 'spec_helper'

describe Agent::SessionsController do
  describe "POST 'create'" do

    context "agent log in" do
      it "logs in the agent and redirects to the agent dashboard" do
        @request.env["devise.mapping"] = Devise.mappings[:agent]
        agent = FactoryGirl.create(:agent)
        post 'create', :agent => {:email => agent.email, :password => agent.password }
        expect(response).to redirect_to agent_root_url 
      end
    end

  end
end
