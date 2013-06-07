source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'awesome_nested_set'
gem 'bootstrap-sass', '~> 2.3.1.0'
gem 'cancan'
gem 'devise'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
#gem 'jquery-ui-bootstrap-rails'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'simple_form'
gem 'simple-navigation'

group :development do
  gem 'thin'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rb-inotify', '>= 0.9.0'
  gem 'awesome_print'
  gem 'rails-erd'
end

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'spork'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
