source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

gem 'scenic'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use faker as data generator
gem 'faker'
# Use activerecord-import for bulk inserting data using ActiveRecord
gem 'activerecord-import'

gem 'colorize'

gem 'httparty'

gem 'dotenv-rails'

gem 'fast_jsonapi'

gem 'whenever'

gem 'virtus'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
end

group :development do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
