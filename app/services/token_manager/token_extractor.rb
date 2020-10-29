# frozen_string_literal: true

module TokenManager
  class TokenExtractor < ApplicationService
    attr_reader :request, :encryptor

    def initialize(request, encryptor = Encryptors::Sha256)
      super()

      @request = request
      @encryptor = encryptor
    end

    def call
      return if auth_token_from_headers.blank?

      AuthenticationToken.find_by(
        value_digest: encryptor.call(auth_token_from_headers)
      )
    end

    private

    def auth_token_from_headers
      @auth_token_from_headers ||= request.env['HTTP_X_AUTH_TOKEN']
    end
  end
end
