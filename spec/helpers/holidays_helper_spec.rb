
require "spec_helper"

describe HolidaysHelper do
  
  describe "#holiday_summary" do
    it "describes the holiday nicely" do 
      country = FactoryGirl.create(:country, :name => "Australia")
      holiday = FactoryGirl.create(:holiday, :nights => 2, :adults => 1, :children => 2, :budget => 2000, :country => country)
      expect(helper.holiday_summary(holiday)).to eq("2 night holiday for 1 adult and 2 children to Australia with a budget of £2000 (Ballpark)")
    end
  end

  describe "#budget_type" do
    context "when ballpark is true" do
      it "returns 'Ballpark'" do
        expect(helper.budget_type(FactoryGirl.create(:holiday, :ballpark => true))).to eq "Ballpark"
      end
    end
    context "when ballpark is false" do
      it "returns 'Max'" do
        expect(helper.budget_type(FactoryGirl.create(:holiday, :ballpark => false))).to eq "Maximum"
      end
    end
  end

end

