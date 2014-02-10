require "spec_helper"

describe HolidaysController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agent/holidays").to route_to("agent/holidays#index")
    end

   it "routes to #show" do
      expect(:get => "/agent/holidays/1").to route_to("agent/holidays#show", :id => "1")
    end

  end
end
