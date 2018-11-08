# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
end
