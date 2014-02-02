require 'spec_helper'

describe HolidaysController do

  describe "GET 'index'" do
    it "returns http success" do
      # sign_in :traveller, FactoryGirl.create(:traveller)
      log_in_as :traveller
      get 'index'
      expect(response).to be_success
    end
  end
end
