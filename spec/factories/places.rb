FactoryGirl.define do
  sequence :municipal_name do |n| 
    "Municipal #{n}"
  end

  sequence :obsplace_name do |n| 
    "Obsplace #{n}"
  end

  factory :place do
    association :country, factory: [:country]
    municipal { generate :municipal_name }
    obsplace { generate :obsplace_name }
  end

end
