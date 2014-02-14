require 'spec_helper'

describe Pitch do
  describe "Attributes and Associations" do
    context "Attributes" do
      [:min, :max, :expertise, :content].each  do |method|
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

    context "Invalidatated Model" do
      after(:each) { expect(subject).to_not be_valid }

      specify("holiday presence") { subject.holiday_id = nil }
      specify("agent presence") { subject.agent_id = nil }
      specify("min presence") { subject.min = nil }
      specify("max presence") { subject.max = nil }
      specify("expertise presence") { subject.expertise = nil }
      specify("min numericality") { subject.min = "Foo" }
      specify("max numericality") { subject.max = "Foo" }
      specify("expertise numericality") { subject.expertise = "Foo" }
      specify("expertise range") { subject.expertise = 3 }
      specify("min > 0") { subject.min = 0 }
      specify("max > 0") { subject.max = 0 }

      specify("min/max value") do
        subject.min = 10000; subject.max = 10000; expect(subject).to be_valid
        subject.max = 9999
      end
    end
  end
end
