source 'https://rubygems.org'
ruby '1.9.3'

#I don't know why heroku runs no bundle
gem 'bundler'

#ruby-gemset=railstutorial_rails_4_0

# Use rspec+selenium_webdriver+capybara as for test
group :development, :test do
    gem 'rspec-rails'
    gem 'pry-nav'
    gem 'pry-rails'
end
group :test do
  gem 'sqlite3'
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

gem 'rails', '4.0.2'
gem 'rake'

# Layout
gem 'bootstrap-sass'
gem "therubyracer"
gem "less-rails" 
gem "twitter-bootstrap-rails"
gem "font-awesome-rails"

gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

gem 'will_paginate'
gem 'will_paginate-bootstrap'

# Documentation
group :doc do
  gem 'sdoc', '0.3.20', require: false
end

  gem 'pg'

group :production do
  gem 'rails_12factor'
end


# Authentication
gem 'devise'
# Authorization
gem 'cancan'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
#>>>>>>> heroku
