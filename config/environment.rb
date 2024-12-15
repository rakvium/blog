# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Set up a default secret enrcyptor key salt for development and test environments
ENV['SECRET_ENCRYPTOR_KEY_SALT'] ||= 'verysecretsalt' if Rails.env.local?
# Check if secret encryptor key salt is set to avoid server errors in runtime
ENV.fetch('SECRET_ENCRYPTOR_KEY_SALT')

# Initialize the Rails application.
Rails.application.initialize!
