# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

if ENV['CI'] == 'true'
  require 'simplecov'
  SimpleCov.start
end

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'factory_bot_rails'
require 'shoulda/matchers'
require 'database_cleaner'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :deletion : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
