source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.6.3"

gem "bcrypt", "3.1.13"
gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap-sass", "~> 3.4.1"
gem "bootstrap-will_paginate", "~> 1.0.0"
gem "bootstrap3-datetimepicker-rails", "~> 4.17.47"
gem "cancancan"
gem "config"
gem "devise"
gem "faker", "~> 2.1.2"
gem "figaro"
gem "image_processing", "1.9.3"
gem "jbuilder", "~> 2.7"
gem "jquery-rails"
gem "momentjs-rails", ">= 2.9.0"
gem "omniauth"
gem "omniauth-facebook"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.0"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "social-share-button"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "mysql2", "~> 0.5.2"
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: "master"
  end
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "shoulda-matchers", github: "thoughtbot/shoulda-matchers"
  gem "rails-controller-testing"
  gem "factory_bot_rails"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
