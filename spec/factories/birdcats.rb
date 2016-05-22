FactoryGirl.define do
  factory :birdcat do

    trait :named do
      after :build do |b| 
        b.birdcatnames << create(:birdcatname_en, birdcat: b)
        b.birdcatnames << create(:birdcatname_sv, birdcat: b)
      end
    end

    trait :top_level do
      parent nil
    end
    
    trait :sub_level do
      association :parent, factory: [:top_birdcat]
    end
    
    factory :named_birdcat, traits: [:named]
    factory :top_birdcat, traits: [:top_level, :named]
    factory :sub_birdcat, traits: [:sub_level, :named]
  end

end
