# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Lorem.characters(8) }

    trait :admin do
      type { 'Admin' }
    end

    trait :root do
      type { 'Root' }
    end
  end
end
