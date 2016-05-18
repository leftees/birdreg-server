FactoryGirl.define do
  sequence :bcn_name do |n| 
    "Birdcat #{n}"
  end
  
  factory :birdcatname do
    association :lang, factory: [:lang_en]
    birdcat
    name { generate :bcn_name }
  end

end
