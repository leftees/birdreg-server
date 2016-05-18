FactoryGirl.define do
  factory :observation do
    association :place, factory: [:place]
    stamp Time.now
    estamp Time.now
  end

end
