require 'spec_helper'

describe Country do
  describe "Validations" do
    subject { FactoryGirl.create(:country) }

    it "has a valid factory" do      
      expect(subject).to be_valid
    end

    it "validates presence of name" do
      subject.name = ""
      expect(subject).to_not be_valid
    end

  end
end
