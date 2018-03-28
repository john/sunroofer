source 'https://rubygems.org'

# git_source(:github) do |repo_name|
#   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
#   "https://github.com/#{repo_name}.git"
# end

gem 'acts-as-taggable-on'
gem 'aws-sdk'
gem 'devise'
gem 'friendly_id'
gem 'gmaps4rails'
gem 'haml-rails'
gem 'httparty'
gem 'humane-rails'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.2.0.rc2'
gem 'sass-rails'
gem 'shrine'
gem 'uglifier', '>= 1.3.0'
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
  gem 'capybara'
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
  gem 'factory_girl_rails', require: false
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'shrine-memory'
end

ruby "2.4.3"