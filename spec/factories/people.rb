FactoryGirl.define do
  sequence :person_name do |n| 
    "Person #{n}"
  end

  sequence :person_info do |n| 
    "Info #{n}"
  end

  factory :person do
    name { generate :person_name }
    info { generate :person_info }
    
    trait :visible do
      visible true
    end
    
    trait :hidden do
      visible false
    end
    
    factory :visible_person, traits: [:visible]
    factory :hidden_person, traits: [:hidden]
  end
end
