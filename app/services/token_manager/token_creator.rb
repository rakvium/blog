# frozen_string_literal: true

module TokenManager
  class TokenCreator < ApplicationService
    include RandomToken

    attr_reader :resource, :request, :encryptor

    def initialize(resource, request, encryptor = Encryptors::Sha256)
      super()

      @resource = resource
      @request = request
      @encryptor = encryptor
    end

    def call
      token, encrypted_token = generate_token_pairs

      resource.authentication_tokens.create!(
        last_used_at: Time.current,
        ip_address: request.remote_ip,
        user_agent: request.user_agent,
        value_digest: encrypted_token
      )

      token
    end

    private

    def generate_token_pairs
      loop do
        token = generate_unique_secure_token
        encrypted_token = encryptor.call(token)

        break [token, encrypted_token] unless AuthenticationToken.exists?(value_digest: encrypted_token)
      end
    end
  end
end
