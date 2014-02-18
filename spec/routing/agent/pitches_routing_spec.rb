require "spec_helper"

describe Agent::PitchesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "agent/pitches").to route_to("agent/pitches#index")
    end

    it "routes to #new" do
      expect(:get => "agent/holidays/2/pitches/new").to_not route_to("agent/pitches#new", :holiday_id => "2")
    end

    it "routes to #show" do
      expect(:get => "agent/holidays/2/pitches/1").to route_to("agent/pitches#show", :id => "1", :holiday_id => "2")
    end

    it "routes to #edit" do
      expect(:get => "agent/holidays/2/pitches/1/edit").to route_to("agent/pitches#edit", :id => "1", :holiday_id => "2")
    end
    it :"routes to #create" do
      expect(:post => "agent/holidays/2/pitches").to route_to("agent/pitches#create", :holiday_id => "2")
    end

    it "routes to #update" do
      expect(:put => "/agent/holidays/2/pitches/1").to route_to("agent/pitches#update", :id => "1", :holiday_id => "2")
    end

    it "routes to #destroy" do
      expect(:delete => "agent/holidays/2/pitches/1").to route_to("agent/pitches#destroy", :id => "1", :holiday_id => "2")
    end

  end
end
