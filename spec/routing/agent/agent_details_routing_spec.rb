require "spec_helper"

describe Agent::AgentDetailsController do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "agent/agent_details").to route_to("agent/agent_details#show")
    end

    it "routes to #edit" do
      expect(:get => "agent/agent_details/edit").to route_to("agent/agent_details#edit")
    end

    it "routes to #update" do
      expect(:put => "agent/agent_details/").to route_to("agent/agent_details#update")
    end
  end
end
