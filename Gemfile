# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 3.3.9'

gem 'rails', '~> 7.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Authorization
gem 'cancancan', '~> 2.0'
# Authentication
gem 'devise', '~> 4.9'
gem 'devise-i18n'
# Database
gem 'pg'
# Web server
gem 'puma'

# Assets
gem 'jquery-rails'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'terser'
gem 'turbolinks'

# Pagination
gem 'will_paginate'

# API
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'

# Implementation of GraphQL
gem 'graphql'
# Documentation for graphql schema
gem 'graphql-docs'

# Environments
gem 'dotenv-rails'

# Code quality
gem 'rubocop', '~> 1.66', require: false
gem 'rubocop-factory_bot', '~> 2.26', '>= 2.26.1', require: false
gem 'rubocop-faker', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false
gem 'rubocop-rspec_rails', require: false

group :development do
  # Mount the GraphiQL IDE
  gem 'graphiql-rails', git: 'https://github.com/rmosolgo/graphiql-rails', ref: '6b34eb1'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :development, :test do
  gem 'faker'
  gem 'letter_opener'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-remote'
end

# Use rspec+selenium_webdriver+capybara as for test
group :test do
  gem 'capybara', '~> 2.2'
  # gem 'codeclimate-test-reporter', '~> 1.0.0' # Removed: Code Climate API deprecated (July 2025)
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'i18n-spec'
  gem 'rspec-rails', '~> 7.1'

  gem 'selenium-webdriver', '~> 2.37'
  gem 'shoulda-matchers', '~> 6.4'
  gem 'simplecov', require: false
end
