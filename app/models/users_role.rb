# defines which user have which role
class UsersRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
