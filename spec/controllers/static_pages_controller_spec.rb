require 'spec_helper'

describe StaticPagesController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      expect(response).to be_success
    end
  end

  describe "GET 'faq'" do
    it "returns http success" do
      get 'faq'
      expect(response).to be_success
    end
  end

  describe "GET 'privacy'" do
    it "returns http success" do
      get 'privacy'
      expect(response).to be_success
    end
  end

  describe "GET 'terms'" do
    it "returns http success" do
      get 'terms'
      expect(response).to be_success
    end
  end

end
