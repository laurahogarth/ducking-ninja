
require "spec_helper"

describe HolidaysHelper do

  describe "#holiday_pax_summary" do
    context "when there are adults and children" do
      it "displays both adults and children" do
        holiday = FactoryGirl.build(:holiday, adults: 2, children: 2)
        expect(helper.holiday_pax_summary(holiday)).to eq "2 adults and 2 children"
      end
    end
    context "when there are no children" do
      it "only displays the adults" do
        holiday = FactoryGirl.build(:holiday, adults: 2, children: 0)
        expect(helper.holiday_pax_summary(holiday)).to eq "2 adults"
      end
    end
    context "when there are no adults" do
      it "only displays the children" do
        holiday = FactoryGirl.build(:holiday, adults: 0, children: 2)
        expect(helper.holiday_pax_summary(holiday)).to eq "2 children"
      end
    end
    context "when there is only 1 of each" do
      it "pluralizes correctly" do
        holiday = FactoryGirl.build(:holiday, adults: 1, children: 1)
        expect(helper.holiday_pax_summary(holiday)).to eq "1 adult and 1 child"
      end
    end
  end

  describe "#holiday_duration_summary" do
    context "when there is one night" do
      it "displays 1 night" do
        holiday = FactoryGirl.build(:holiday, nights: 1)
        expect(helper.holiday_duration_summary(holiday)).to eq "1 night"
      end
    end
    context "when there are multiple nights" do
      it "pluralizes correctly" do
        holiday = FactoryGirl.build(:holiday, nights: 2)
        expect(helper.holiday_duration_summary(holiday)).to eq "2 nights"
      end
    end
  end

  describe  "#holiday_budget_summary" do
    it "adds the pound sign to the beginning of the budget" do
      holiday = FactoryGirl.build(:holiday, budget: 1000)
      expect(helper.holiday_budget_summary(holiday)).to eq "&pound;1000"
    end
  end

end

