# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 3.2.5'

gem 'rails', '~> 6.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

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
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'

# Pagination
gem 'will_paginate'
gem 'will_paginate-bootstrap'

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
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
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
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'i18n-spec'
  gem 'rspec-rails', '~> 6.1'

  gem 'selenium-webdriver', '~> 2.37'
  gem 'shoulda-matchers', '~> 6.4'
  gem 'simplecov', require: false
end
