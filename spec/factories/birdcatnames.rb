FactoryGirl.define do
  sequence :bcn_name_en do |n| 
    "Birdcat #{n}"
  end
  
  sequence :bcn_name_sv do |n| 
    "F\u00e5gelkategori #{n}"
  end
  
  factory :birdcatname do
    association :lang, factory: [:lang_en]
    birdcat
    name { generate :bcn_name_en }
    
    trait :english do
    end
    
    trait :swedish do
      association :lang, factory: [:lang_sv]
      birdcat
      name { generate :bcn_name_sv }
    end
    
    factory :birdcatname_en, traits: [:english]
    factory :birdcatname_sv, traits: [:swedish]
  end
end
