
require 'spec_helper'

describe Agent::HolidaysController do
  before do
    #Sign in a traveller, create them a holiday
    FactoryGirl.create_list(:holiday, 10)
    @agent = FactoryGirl.create(:agent)
    sign_in :agent, @agent
  end 

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(assigns(:holidays)).to eq Holiday.all
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      holiday = FactoryGirl.create(:holiday)
      get 'show', id: holiday.id
      expect(assigns(:holiday).id).to eq holiday.id
      expect(response).to be_success
    end
  end
end
