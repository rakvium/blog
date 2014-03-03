# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seed data goes here"
# add root role
Role.create!(:name => 'root')
# add admin role
Role.create!(:name => 'admin')
# add user role
Role.create!(:name => 'user')
# add root user
User.create!(
  :email => 'rakvium@gmail.com',
  :password => '1234',
  :encrypted_password => '1234',
  :first_name => 'Victor',
  :last_name => 'Rak')
# add root role to root user
UsersRole.create!(
  :user_id => User.where(:email=>"rakvium@gmail.com").first.id,
  :role_id => Role.where(:name=>"root").first.id)