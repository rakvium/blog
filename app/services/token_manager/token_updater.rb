# frozen_string_literal: true

module TokenManager
  class TokenUpdater < ApplicationService
    UPDATE_AFTER_TIME = 3600

    attr_reader :token

    def initialize(token)
      super()

      @token = token
    end

    def call
      return if token.blank?

      token.tap do |value|
        # rubocop:disable Rails/SkipsModelValidations
        value.touch(:last_used_at) if value.last_used_at < UPDATE_AFTER_TIME.seconds.ago
        # rubocop:enable Rails/SkipsModelValidations
      end
    end
  end
end
