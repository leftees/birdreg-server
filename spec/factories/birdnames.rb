# coding: utf-8
FactoryGirl.define do
  sequence :bn_name_en do |n| 
    "Bird #{n}"
  end
  
  sequence :bn_name_sv do |n| 
    "F\u00e5gel #{n}"
  end
  
  factory :birdname do
    association :lang, factory: [:lang_en]
    bird
    name { generate :bn_name_en }
    
    trait :english do
    end
    
    trait :swedish do
      association :lang, factory: [:lang_sv]
      bird
      name { generate :bn_name_sv }
    end
    
    factory :birdname_en, traits: [:english]
    factory :birdname_sv, traits: [:swedish]
  end

end
