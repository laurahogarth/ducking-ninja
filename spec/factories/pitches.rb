# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pitch do
    min 1
    max 1
    expertise 1
    content "MyText"
    agent_id 1
    holiday_id 1
  end
end
