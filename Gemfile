source 'https://rubygems.org'

ruby '2.1.10'

# Use grape for API
gem 'grape', '0.17.0'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rubocop', '~> 0.46.0'
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

gem 'rails', '~> 4.2'
gem 'rake', '< 11.0'

# Authorization
gem 'cancan'
# Authentication
gem 'devise', '~> 4.3'
# Database
gem 'pg'

# Layout
gem 'bootstrap-sass'
gem 'coffee-rails', '4.0.1'
gem 'jbuilder', '1.0.2'
gem 'jquery-rails', '~> 3.1.3'
gem 'less-rails'
gem 'sass-rails', '~> 4.0.1'
gem 'therubyracer'
gem 'turbolinks', '~> 2.3.0'

gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 2.7.2'

gem 'will_paginate'
gem 'will_paginate-bootstrap'

# Documentation
group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor'
end
