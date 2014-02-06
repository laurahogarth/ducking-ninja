require "spec_helper"

describe AgentsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agents/1/dashboard").to route_to("agents#dashboard", :id => "1")
    end

  end
end
