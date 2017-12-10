FactoryGirl.define do
  
  factory :building do
    name 'Transamerica Building'
    association :roof_set, factory: :roof_set
    association :user, factory: :user
  end
  
end
