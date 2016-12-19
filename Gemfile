source 'https://rubygems.org'

# TODO: check if bundler gem is really needed for heroku
gem 'bundler'

# Use rspec+selenium_webdriver+capybara as for test
group :development, :test do
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :test do
  gem 'capybara', '2.1.0'
  gem 'selenium-webdriver', '2.35.1'
  gem 'sqlite3'
end

gem 'rails', '4.0.2'
gem 'rake'

# Authorization
gem 'cancan'
# Authentication
gem 'devise'
# Database
gem 'pg'

# Layout
gem 'bootstrap-sass'
gem 'coffee-rails', '4.0.1'
gem 'jbuilder', '1.0.2'
gem 'jquery-rails', '3.0.4'
gem 'less-rails'
gem 'sass-rails', '4.0.1'
gem 'therubyracer'
gem 'turbolinks', '1.1.1'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '2.1.1'
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# Documentation
group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor'
end
