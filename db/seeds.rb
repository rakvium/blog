# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rails.logger.info 'Seed data goes here'
# add root role
Role.find_or_create_by(name: 'root')
# add admin role
Role.find_or_create_by(name: 'admin')
# add user role
Role.find_or_create_by(name: 'user')
# add root user
User.find_or_create_by(email: 'rakvium@gmail.com') do |u|
  u.password = '1234'
  u.password_confirmation = '1234'
  u.first_name = 'Victor'
  u.last_name = 'Rak'
end
# add root role to root user
UsersRole.find_or_create_by(
  user_id: User.where(email: 'rakvium@gmail.com').first.id,
  role_id: Role.where(name: 'root').first.id
)
