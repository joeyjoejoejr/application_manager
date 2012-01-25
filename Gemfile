source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

gem 'jquery-rails'
gem 'execjs'
gem 'therubyracer'
gem 'will_paginate', '3.0.pre4'
gem 'nested_form', :git => "git://github.com/ryanb/nested_form.git"
gem 'pdfkit'
gem 'wkhtmltopdf-binary'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "sqlite3-ruby", :group => [:development,:test]
gem "rspec-rails", ">= 2.4.1", :group => [:development]
group :development do
  gem 'guard'
  gem "guard-cucumber"
  gem "guard-rspec"
  gem "guard-spork"
  gem "spork", "> 0.9.0.rc"
  gem 'ruby_gntp'
  gem 'annotate', '~> 2.4.1.beta'
  gem 'faker', '0.3.1' 
end

gem "jquery-rails"

group :test do
  gem "spork", "> 0.9.0.rc"
  gem "webrat"
  gem "guard-spork"
  gem "database_cleaner"
  gem "launchy"
  gem "cucumber-rails"
  gem "capybara", "0.4.0"
  gem "factory_girl_rails", "1.1.beta1"
  gem 'turn', '~> 0.8.3', :require => false
end
