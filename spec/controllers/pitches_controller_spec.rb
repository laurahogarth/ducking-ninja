
require 'spec_helper'

describe PitchesController do
  before do
    @traveller = FactoryGirl.create(:traveller)
    @holiday = FactoryGirl.create(:holiday, :traveller => @traveller)
    @pitch = FactoryGirl.create(:pitch, :holiday => @holiday)
    sign_in :traveller, @traveller
  end 

  describe "GET index" do
    it "assigns all pitches as @pitches" do
      get :index
      expect(assigns(:pitches)).to eq([@pitch])
    end
  end

  describe "GET show" do
    it "assigns the requested pitch as @pitch" do
      get :show, {:holiday_id => @holiday, :id => @pitch}
      expect(assigns(:pitch)).to eq(@pitch)
    end
  end
end
