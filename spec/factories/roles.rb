# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { :user }

    trait :admin do
      name { :admin }
    end

    trait :root do
      name { :root }
    end
  end
end
