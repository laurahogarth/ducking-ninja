require 'spec_helper'

describe Pitch do
  describe "Attributes and Associations" do
    context "Attributes" do
      [:min, :max, :expertise, :status, :content].each  do |method|
        it { should respond_to method }
      end 
    end
    context "Associations" do
      [:agent, :holiday].each do |method|
        it { should respond_to method }
      end
    end
  end

  describe "Validations" do
    subject { FactoryGirl.create(:pitch) }

    it("should have a valid factory") { expect(subject).to be_valid }

    context "expertise" do
      it "should not let people set invalid expertise" do
        expect { 
          subject.expertise = "foo"
        }.to raise_error ArgumentError
      end
    end

    context "status" do
      it "should not let people set invalid status" do
        expect { 
          subject.status = "foo"
        }.to raise_error ArgumentError
      end
    end

    context "Invalidatated Model" do
      after(:each) { expect(subject).to_not be_valid }

      specify("holiday presence") { subject.holiday_id = nil }
      specify("agent presence") { subject.agent_id = nil }
      specify("min presence") { subject.min = nil }
      specify("max presence") { subject.max = nil }
      specify("min numericality") { subject.min = "Foo" }
      specify("max numericality") { subject.max = "Foo" }
      specify("min > 0") { subject.min = 0 }
      specify("max > 0") { subject.max = 0 }

      specify("min/max value") do
        subject.min = 10000; subject.max = 10000; expect(subject).to be_valid
        subject.max = 9999
      end
    end
    context "when the agent has already pitched on a holiday" do
      it "should be invalid!" do
        holiday = FactoryGirl.create(:holiday)
        agent = FactoryGirl.create(:agent)
        pitch_1 = FactoryGirl.create(:pitch, :holiday => holiday, :agent => agent)
        expect(pitch_1).to be_valid
        pitch_2 = FactoryGirl.build(:pitch, :holiday => holiday, :agent => agent)
        expect(pitch_2).not_to be_valid
      end
    end

    describe "Instance Methods" do
      describe "#generate_ref" do
        it "assigns a ref number to a newly saved pitch" do
          pitch = FactoryGirl.build(:pitch)
          expect(pitch.ref).to be_nil        
          iso = pitch.holiday.country.iso_2
          pitch.save
          expect(pitch.ref).to eq ("#{iso}#{DB_VERSION}#{pitch.id}")
        end
      end
    end

  end
end
