FactoryGirl.define do
  sequence :person_name do |n| 
    "Person #{n}"
  end
  factory :person do
    name { generate :person_name }
  end

end
