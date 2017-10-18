FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Lorem.characters(8) }

    trait :admin do
      roles { [FactoryGirl.create(:role, :admin)] }
    end

    trait :root do
      roles { [FactoryGirl.create(:role, :root)] }
    end
  end
end
