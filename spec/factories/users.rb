# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.safe_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Lorem.characters(number: 8) }
  end

  factory :root, parent: :user, class: 'Root' do
    type { 'Root' }
  end

  factory :admin, parent: :user, class: 'Admin' do
    type { 'Admin' }
  end

  factory :author, parent: :user, class: 'Author' do
    type { 'Author' }
  end

  factory :guest, parent: :user, class: 'Guest' do
    type { 'Guest' }
  end
end
