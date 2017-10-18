FactoryGirl.define do
  factory :role do
    name :user

    trait :admin do
      name :admin
    end

    trait :root do
      name :root
    end
  end
end
