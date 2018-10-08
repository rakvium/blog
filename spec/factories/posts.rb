# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    text { Faker::Lorem.paragraph }
    title { Faker::Lorem.characters }
    user
  end
end
