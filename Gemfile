source 'https://rubygems.org'

git_source(:github) do |repo|
  repo = "#{repo}/#{repo}" unless repo.include?("/")
  "https://github.com/#{repo}.git"
end

ruby "2.7.0"

gem 'acts-as-taggable-on'
gem 'aws-sdk-s3'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'friendly_id'
gem 'gmaps4rails'
gem 'haml-rails', git: 'https://github.com/indirect/haml-rails'
gem 'httparty'
gem 'humane-rails'
gem 'pg'
gem 'puma'
gem 'rails', '6.0.3.7'
gem 'rails-html-sanitizer'
gem 'sass-rails', '~> 5.0'
gem 'shrine'
gem 'uglifier'
 # gem 'webpacker'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# removing platform flad so it'll run on docker alpine
gem 'tzinfo-data' #, platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'dotenv-rails'
  gem 'bundler-audit', require: false
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails'
  gem 'seed_dump'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'chromedriver-helper'
  gem 'factory_girl_rails', require: false
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'shrine-memory'
end
