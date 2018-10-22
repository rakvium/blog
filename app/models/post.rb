# frozen_string_literal: true

class Post < ApplicationRecord
  # TODO: Check deeply these relations and, probably, refactor posts at all
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 255 }
end
