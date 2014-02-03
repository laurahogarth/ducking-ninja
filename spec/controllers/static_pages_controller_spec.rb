require 'spec_helper'

describe StaticPagesController do

  [:about, :faq, :privacy, :terms].each do |static_page|
    describe "GET #{static_page}" do
      it "returns http success" do
        get static_page
        expect(response).to be_success
      end
    end
  end

end
