require "spec_helper"

describe PitchesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "pitches").to route_to("pitches#index")
    end

    it "routes to #show" do
      expect(:get => "holidays/2/pitches/1").to route_to("pitches#show", :id => "1", :holiday_id => "2")
    end

    it "routes to #update_status" do
      expect(:patch => "holidays/2/pitches/1/update_status").to route_to("pitches#update_status", :id => "1", :holiday_id => "2")
    end


  end
end
