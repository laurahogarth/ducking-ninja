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

    it "should limit the traveller to 10 holidays" do
      traveller = FactoryGirl.create(:traveller)
      10.times do
        FactoryGirl.create(:holiday, traveller: traveller)
      end
      expect{ FactoryGirl.create(:holiday, traveller: traveller) }.to raise_error ActiveRecord::RecordInvalid
    end

    context "Invalidatated Model" do
      after(:each) { expect(subject).to_not be_valid }
      specify("country presence") { subject.country_id = nil }
      specify("traveller presence") { subject.traveller_id = nil }
      specify("earilest_date presence") { subject.earliest_date = nil } 
      specify("latest_date presence") { subject.latest_date = nil } 
      specify("budget_presence") { subject.budget = nil  }
      specify("adults >= 0") { subject.adults = -1 }
      specify("children >= 0") { subject.children = -1 }
      specify("nights > 0") { subject.nights = 0 }
      specify("budget format") { subject.budget = "Foo" }
      specify("earliest_date in future") { subject.earliest_date = Date.current - 1.day }
      specify("latest_date in future") { subject.latest_date = Date.current - 1.day }
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

    describe "Scopes" do
      before do 
        @agent = FactoryGirl.create(:agent)
        @pitched_holiday = FactoryGirl.create(:holiday, :region => "Pitched on")
        @pitched_holiday.pitches << FactoryGirl.create(:pitch, :agent => @agent)
        @unpitched_holiday = FactoryGirl.create(:holiday, :region => "Unpitched on")
        @old_holiday_pitched_on_by_someone_else = FactoryGirl.create(:holiday, :updated_at => DateTime.now - 2.weeks, :region => "Old")
        @old_holiday_pitched_on_by_someone_else.pitches << FactoryGirl.create(:pitch)
      end

      it "returns 'recent' holidays updated within the last week for" do
        recent_holiday_ids = Holiday.recent.ids
        expect(recent_holiday_ids).to include(@pitched_holiday.id)
        expect(recent_holiday_ids).to_not include(@old_holiday_pitched_on_by_someone_else.id)
      end

      it "returns pitched_on holidays for an agent" do
        expect(Holiday.pitched_on_by(@agent)).to include(@pitched_holiday)
        expect(Holiday.pitched_on_by(@agent)).to_not include(@unpitched_holiday)
      end
      it "returns unpitched_on holidays for an agent" do
        expect(Holiday.unpitched_on_by(@agent)).to_not include(@pitched_holiday)
        expect(Holiday.unpitched_on_by(@agent)).to include(@unpitched_holiday)
      end
    end
  end
end
