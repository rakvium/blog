# frozen_string_literal: true

Rails.logger.info 'Seeding...'

User.find_or_create_by(email: 'rakvium@gmail.com') do |u|
  u.password = '1234'
  u.password_confirmation = '1234'
  u.first_name = 'Victor'
  u.last_name = 'Rak'
  u.type = 'Root'
end
