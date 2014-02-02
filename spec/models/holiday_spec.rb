require 'spec_helper'

describe Holiday do
  
  describe "Attributes and Associations" do
    context "Attributes" do
      [:earliest_date, :latest_date, :budget, :adults, :children, :nights, :ballpark?, :include_travel?].each  do |method|
        it { should respond_to method }
      end 
    end
    context "Associations" do
      it { should respond_to :country }
      it { should respond_to :traveller }
    end
  end



  describe "Validations" do
    subject { FactoryGirl.create(:holiday) }

    def flunk_subject
      expect(subject).to_not be_valid
    end
    
    it("should have a valid factory") { expect(subject).to be_valid }
    specify("country presence") { subject.country_id = nil; flunk_subject }
    specify("earilest_date presence") { subject.earliest_date = nil; flunk_subject } 
    specify("latest_date presence") { subject.latest_date = nil; flunk_subject } 
    specify("budget_presence") { subject.budget = nil; flunk_subject }
    specify("adults >= 0") { subject.adults = -1; flunk_subject}
    specify("children >= 0") { subject.children = -1; flunk_subject}
    specify("nights > 0") { subject.nights = 0; flunk_subject}
    specify "has at least one pax" do
      subject.adults = 0
      subject.children = 0
      flunk_subject   
    end
    describe "has_valid_dates" do
      context "when the difference between latest and earliest date is less than nights" do
        it "flunks" do
          subject.earliest_date = Date.current
          subject.latest_date = Date.current + 1.day
          subject.nights = 4
          flunk_subject
        end
      end
      context "when latest date is earlier than the earliest date" do
        it "flunks" do
          subject.earliest_date = Date.current
          subject.latest_date = Date.current - 1.day
          flunk_subject
        end
      end
    end
  end
end
