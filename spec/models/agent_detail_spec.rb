require 'spec_helper'

describe AgentDetail do

  context "Attributes" do
    subject { FactoryGirl.create(:agent_detail) }
    it("should have a valid factory") { expect(subject).to be_valid }
  end

  context "Validations" do
    context "Invalidatated Model" do
      subject { FactoryGirl.create(:agent_detail) }
      after(:each) { expect(subject).to_not be_valid }
      
      # Presence
      specify("name presence") { subject.name = nil }
      specify("address_1 presence") { subject.address_1 = nil }
      specify("town presence") { subject.town = nil }
      specify("postcode presence") { subject.postcode = nil }
      specify("email presence") { subject.email = nil }
      specify("main phone presence") { subject.main_phone = nil }
      
      # Formats
      specify("email format") { subject.email = "billyBollocks!" }
      specify("main phone format") { subject.main_phone = "AAHKJH183" }
      specify("alt phone format") { subject.alt_phone = "AAHKJH183" }
      specify("fax format") { subject.fax = "AAHKJH183" }
      specify("postcode format") { subject.postcode = "1234566" }
    end
  end

end
