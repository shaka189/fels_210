source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.0"

gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass", "3.3.7"
gem "carrierwave", "1.1.0"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "delayed_job_active_record"
gem "devise"
gem "faker", :git => "https://github.com/stympy/faker.git", :branch => "master"
gem "figaro"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "4.3.1"
gem "kaminari"
gem "mini_magick", "4.7.0"
gem "mysql2"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "rails-i18n"
gem "ransack", "~> 1.7"
gem "sass-rails", "~> 5.0.7"
gem "sidekiq"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "builder", "~> 3.2", ">= 3.2.2"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "erubi", "~> 1.5"
  gem "factory_bot_rails", require: false
  gem "method_source", "~> 0.9.0"
  gem "nokogiri", "~> 1.6", ">= 1.6.5"
  gem "rack-test", "~> 1.0.0"
  gem "rails-controller-testing", "~> 0.0.3"
  gem "rails-html-sanitizer", "~> 1.0", ">= 1.0.3"
  gem "rake", "~> 11.2", ">= 11.2.2"
  gem "rspec-rails", "~> 3.6"
  gem "shoulda-matchers", "~> 3.1"
  gem "thor", "~> 0.20.0"
  gem "selenium-webdriver"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "chromedriver-helper"
  gem "guard-minitest", "2.3.1"
  gem "mini_backtrace", "0.1.3"
  gem "minitest-reporters", "1.0.5"
  gem "rspec-activemodel-mocks"
  gem "simplecov", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

