require "spec_helper"

describe Traveller::HolidaysController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/holidays").to route_to("traveller/holidays#index")
    end

    it "routes to #new" do
      expect(:get => "/holidays/new").to route_to("traveller/holidays#new")
    end

    it "routes to #show" do
      expect(:get => "/holidays/1").to route_to("traveller/holidays#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/holidays/1/edit").to route_to("traveller/holidays#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/holidays").to route_to("traveller/holidays#create")
    end

    it "routes to #update" do
      expect(:put => "/holidays/1").to route_to("traveller/holidays#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/holidays/1").to route_to("traveller/holidays#destroy", :id => "1")
    end

  end
end
