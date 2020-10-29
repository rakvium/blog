# frozen_string_literal: true

module TokenManager
  module RandomToken
    CHARACTERS_SIZE = 24

    def generate_unique_secure_token
      SecureRandom.base58(CHARACTERS_SIZE)
    end
  end
end
