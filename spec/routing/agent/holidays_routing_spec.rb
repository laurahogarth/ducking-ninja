require "spec_helper"

describe Agent::HolidaysController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agent/holidays").to route_to("agent/holidays#index")
    end

   it "routes to #show" do
      expect(:get => "/agent/holidays/1").to route_to("agent/holidays#show", :id => "1")
    end

    it "routes to #pitch" do
      expect(:get => "agent/holidays/2/pitch").to route_to("agent/holidays#pitch", :id => "2")
    end

  end
end
