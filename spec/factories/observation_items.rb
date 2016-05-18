FactoryGirl.define do
  factory :observation_item do
    association :bird, factory: [:bird]
    association :observation, factory: [:observation]
    count 1
  end

end
