# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :traveller do
    sequence(:email) { |n| "test#{n}@test.com" }
  end
end
