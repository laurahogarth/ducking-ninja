# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :holiday do
    country 
    region "My Region"
    nights 4
    earliest_date Date.current
    latest_date Date.current + 1.week
    budget 2000
    ballpark true
    adults 2
    children 0
    include_travel false
    description "A brief description"
  end
end
