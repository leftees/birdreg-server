FactoryGirl.define do
  factory :bird do
    association :birdcat, factory: [:birdcat]
    trait :named do
      after :build do |b| 
        b.birdnames << create(:birdname_en)
        b.birdnames << create(:birdname_sv)
      end
    end
    
    factory :named_bird, traits: [:named]
  end
end
