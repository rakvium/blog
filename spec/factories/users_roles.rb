FactoryBot.define do
  factory :users_role do
    user
    role { Role.find_or_create_by(name: :user) }
  end
end
