FactoryGirl.define do
  factory :bird do
    association :birdcat, factory: [:birdcat]
    trait :named do
      after :build do |b| 
        b.birdnames << create(:birdname_en, bird: b)
        b.birdnames << create(:birdname_sv, bird: b)
      end
    end
    
    factory :named_bird, traits: [:named]
  end
end
