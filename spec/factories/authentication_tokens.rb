# frozen_string_literal: true

FactoryBot.define do
  factory :authentication_token do
    value_digest { Faker::Crypto.sha256 }
    ip_address { Faker::Internet.ip_v4_address }
    user_agent { Faker::Internet.user_agent }
    last_used_at { Time.current }

    user
  end
end
