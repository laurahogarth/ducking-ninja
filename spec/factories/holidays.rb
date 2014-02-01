# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :holiday do
    country 1
    region "MyString"
    nights 1
    earliest_date "2014-02-01"
    latest_date "2014-02-01"
    budget 1.5
    ballpark? false
    adults 1
    children 1
    travel? false
    description "MyText"
  end
end
