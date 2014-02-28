# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seed data goes here"
# add admin role
Role.create!(:id => 1,:name => :admin)
# add admin
User.create!(:id => 1,:email => "rakvium@gmail.com", :password => "1234",
	:first_name => "Victor", :last_name => "Rak")
Users_role.create!(:user_id => 1, :role_id => 1)
# add user role
Role.create(:name => :user)