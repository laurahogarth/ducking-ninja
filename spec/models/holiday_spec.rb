require 'spec_helper'

describe Holiday do

  describe "Validations" do
    subject { FactoryGirl.create(:holiday) }
    it("should have a valid factory") { expect(subject).to be_valid }
  end
end
