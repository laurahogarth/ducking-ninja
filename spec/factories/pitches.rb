# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pitch do
    min 1000
    max 5000
    expertise 1
    content "Some Content!"
    agent
    holiday
  end
end
