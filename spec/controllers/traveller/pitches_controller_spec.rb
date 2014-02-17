
require 'spec_helper'

describe Traveller::PitchesController do
  before do
    @traveller = FactoryGirl.create(:traveller)
    @holiday = FactoryGirl.create(:holiday, :traveller => @traveller)
    @pitch = FactoryGirl.create(:pitch, :holiday => @holiday)
    sign_in :traveller, @traveller
  end 

  describe "GET show" do
    it "assigns the requested pitch as @pitch and marks it as read" do
      expect(@pitch.seen).to eq false
      get :show, {:holiday_id => @holiday, :id => @pitch}
      expect(assigns(:pitch)).to eq(@pitch)
      expect(assigns(:pitch).seen).to eq true
    end
  end
  describe "PATCH update_status" do
    it "updates status and redirects to pitch" do
      patch :update_status, {:holiday_id => @holiday, :id => @pitch, :pitch => { :status => "accepted" } }
      expect(response).to redirect_to [@holiday, @pitch]
    end
  end
end
