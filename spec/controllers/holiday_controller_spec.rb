require 'spec_helper'

describe HolidaysController do
  before do
    #Sign in a traveller, create them a holiday
    @traveller = FactoryGirl.create(:traveller)
    @holiday = FactoryGirl.create(:holiday, :traveller_id => @traveller.id)  
    sign_in :traveller, @traveller
  end 

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: @holiday.id
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', id: @holiday.id
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create', :holiday => FactoryGirl.build(:holiday).attributes
      expect(response).to be_success
    end
  end

  
end
