# frozen_string_literal: true

class AuthenticationToken < ApplicationRecord
  belongs_to :user

  validates :user_agent, :ip_address, :last_used_at, :value_digest, presence: true
end
