# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent_detail do
    name "MyString"
    address_1 "MyString"
    address_2 "MyString"
    town "MyString"
    county "MyString"
    postcode "MyString"
    email "MyString"
    main_phone "MyString"
    alt_phone "MyString"
    fax "MyString"
    managers_name "MyString"
    opening_hours "MyString"
    description "MyText"
  end
end
