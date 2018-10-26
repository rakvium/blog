# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  validates :email, uniqueness: true

  scope :admins, -> { where(type: 'Admin') }
  scope :roots, -> { where(type: 'Root') }
  scope :authors, -> { where(type: 'Author') }

  %w[root admin author].each do |role|
    define_method "#{role}?" do
      type.downcase == role
    end
  end

  def self.roles
    %w[Root Admin Author]
  end
end
