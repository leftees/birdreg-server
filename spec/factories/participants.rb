FactoryGirl.define do
  factory :participant do
    association :person, factory: [:person]
    association :observation, factory: [:observation]
  end

end
