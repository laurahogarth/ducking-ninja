# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent_detail do
    name "MyString"
    address_1 "MyString"
    address_2 "MyString"
    town "MyString"
    county "MyString"
    postcode "T35 7ER"
    email "test@test.com"
    main_phone "0121 123 4567"
    alt_phone "0121 123 4567"
    fax "0121 123 4567"
    website "http://www.google.com"
    managers_name "MyString"
    opening_hours "MyString"
    description "MyText"
    agent
  end
end
