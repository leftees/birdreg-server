FactoryGirl.define do
  factory :lang do
    name "en"
    
    trait :english do
      name "en"
    end
    
    trait :swedish do
      name "sv"
    end
    
    factory :lang_en, traits: [:english]
    factory :lang_sv, traits: [:swedish]
  end

end
