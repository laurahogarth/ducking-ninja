require "spec_helper"

describe Agent::CountriesController do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/agent/countries").to route_to("agent/countries#index")
    end
    it "routes to #holidays" do
      expect(:get => "/agent/countries/1/holidays").to route_to("agent/countries#holidays", :id => "1")
    end

    it "routes to #toggle_favourite" do
      expect(:patch => "/agent/countries/1/toggle_favourite").to route_to("agent/countries#toggle_favourite", :id => "1")
    end
  end
end
