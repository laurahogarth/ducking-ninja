
require 'spec_helper'

describe Devise::SessionsController do
  describe "POST 'create'" do
  
    context "traveller log in" do
      it "logs in the traveller and redirects to the holidays page" do
        @request.env["devise.mapping"] = Devise.mappings[:traveller]
        traveller = FactoryGirl.create(:traveller)
        post 'create', :traveller => {:email => traveller.email, :password => traveller.password }
        expect(response).to redirect_to holidays_url
      end
    end

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
