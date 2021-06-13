# frozen_string_literal: true

module Encryptors
  class Sha256
    def self.call(value, salt = ENV.fetch('SECRET_ENCRYPTOR_KEY_SALT'))
      OpenSSL::HMAC.hexdigest('SHA256', salt, value)
    end
  end
end
