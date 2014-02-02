require 'spec_helper'

describe Holiday do
  
  describe "Attributes and Associations" do
    context "Attributes" do
      [:earliest_date, :latest_date, :budget, :adults, :children, :nights, :ballpark?, :include_travel?].each  do |method|
        it { should respond_to method }
      end 
    end
    context "Associations" do
      [:country, :traveller].each do |method|
        it { should respond_to method }
      end
    end
  end

  describe "Validations" do
    subject { FactoryGirl.create(:holiday) }
    it("should have a valid factory") { expect(subject).to be_valid }

    context "Invalidatated Model" do
      after(:each) { expect(subject).to_not be_valid }
      specify("country presence") { subject.country_id = nil }
      specify("earilest_date presence") { subject.earliest_date = nil } 
      specify("latest_date presence") { subject.latest_date = nil } 
      specify("budget_presence") { subject.budget = nil  }
      specify("adults >= 0") { subject.adults = -1 }
      specify("children >= 0") { subject.children = -1 }
      specify("nights > 0") { subject.nights = 0 }
      specify("budget format") { subject.budget = "Foo" }
      specify "has at least one pax" do
        subject.adults = 0
        subject.children = 0
      end
      describe "has_valid_dates" do
        context "when the difference between latest and earliest date is less than nights" do
          it "flunks" do
            subject.earliest_date = Date.current
            subject.latest_date = Date.current + 1.day
            subject.nights = 4
          end
        end
        context "when latest date is earlier than the earliest date" do
          it "flunks" do
            subject.earliest_date = Date.current
            subject.latest_date = Date.current - 1.day
          end
        end
      end
    end
  end
end
