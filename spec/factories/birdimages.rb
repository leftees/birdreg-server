FactoryGirl.define do
  sequence :bi_name do |n| 
    "Birdimage #{n}"
  end
  
  factory :birdimage do
    association :person, factory: [:person]
    image { generate :bi_name }
  end

end
