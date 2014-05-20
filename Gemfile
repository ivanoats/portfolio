source "https://rubygems.org"

ruby "2.1.2"

gem "coffee-rails", "~> 4.0.0"
gem "devise", "~> 3.2.2"
gem "foundation-rails", "~> 5.0.3"
gem "jbuilder", "~> 1.2"
gem "jquery-rails"
gem "minitest-rails", "2.0.0"
gem "rails", "4.1.1"
gem "sass-rails", "~> 4.0.0"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "pg"
gem "omniauth"
gem 'omniauth-twitter'
gem 'figaro'
gem 'pundit'
gem 'postmark-mitt'
gem 'postmark-rails', '~> 0.7.0'
gem 'sidekiq'
gem 'foreman'
gem 'sinatra', require: false

group :doc do
  gem "sdoc", require: false
end

group :produciton do
  gem "rails_12factor"
end

group :test do
  gem "poltergeist"
end

group :development, :test do
  gem "minitest-rails-capybara", "2.0.0"
  gem "ZenTest"
  gem "autotest-rails"
  gem "autotest-fsevent" # platform: mac
  gem "autotest-growl"
  gem "faker"
  gem "pry-rails"
  gem "pry-byebug"
  gem "pry-doc"
  gem "launchy"
end

gem 'spring', group: :development
