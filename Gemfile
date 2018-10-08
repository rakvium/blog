source 'https://rubygems.org'

ruby '2.4.1'

gem 'dotenv-rails'
gem 'grape', '0.17.0'
gem 'rails', '~> 5.2.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'letter_opener'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-remote'
end

# Use rspec+selenium_webdriver+capybara as for test
group :test do
  gem 'capybara', '2.1.0'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'codecov', require: false
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'selenium-webdriver', '~> 2.37'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'sqlite3'
end

gem 'rake'

# Authorization
gem 'cancan'
# Authentication
gem 'devise'
# Database
gem 'pg'

# Layout
gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'less-rails'
gem 'sass-rails'
gem 'therubyracer'
gem 'turbolinks'

gem 'twitter-bootstrap-rails', '~> 2.2.8'
gem 'uglifier'

gem 'will_paginate'
gem 'will_paginate-bootstrap'

# Documentation
group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor'
end
