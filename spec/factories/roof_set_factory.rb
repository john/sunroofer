FactoryGirl.define do

  factory :roof_set do
    name 'San Francisco Buildings'
    association :user, factory: :user
  end
  
end
