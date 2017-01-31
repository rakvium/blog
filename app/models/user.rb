# authentication and validation for user
class User < ActiveRecord::Base
  before_create :create_role
  has_many :posts
  has_many :comments
  has_many :users_roles
  has_many :roles, through: :users_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true

  def role?(role_name)
    roles.last == Role.where(name: role_name).last
  end

  # create role

  private

  def create_role
    roles << Role.find_or_create_by(name: :user)
  end
end
