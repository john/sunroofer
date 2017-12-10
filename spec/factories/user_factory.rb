FactoryGirl.define do

  factory :user do
    name 'Jamie Farr'
    sequence(:email) { |n| "james#{n}@example.com" }
    password '123456789'
  end
  
end
