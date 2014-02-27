require 'spec_helper'

describe Agent::CountriesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'holidays'" do
    it "returns http success" do
      get 'holidays'
      expect(response).to be_success
    end
  end

end
