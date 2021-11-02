# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  has_many :comments, dependent: :destroy

  before_validation :remove_surrounding_whitespaces

  validates :title, presence: true, length: { maximum: 255 }

  private

  def remove_surrounding_whitespaces
    title.try(:strip!)
  end
end
