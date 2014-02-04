# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent do
    sequence(:email)        { |n| "test#{n}@test.com" }
    password                "welcome1"
    password_confirmation   "welcome1"
  end
end
