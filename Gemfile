source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.21'
# Use scenic for creating views in postgresql
gem 'scenic', "~> 1.5"
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use faker as data generator
gem 'faker', "~> 1.9"
# Use activerecord-import for bulk inserting data using ActiveRecord
gem 'activerecord-import', "~> 1.0"
# Use colorize for beautiful output
gem 'colorize', "~> 0.8"
# Use http requests
gem 'httparty', "~> 0.16"
# Use for using .env in rails project
gem 'dotenv-rails', "~> 2.7"
# Use for json serialization
gem 'fast_jsonapi', "~> 1.5"
# Use for cron jobs
gem 'whenever', "~> 0.11"
# Use for form objects
gem 'virtus', "~> 1.0"

group :development, :test do
  # Use for debugging
  gem 'pry', "~> 0.11"
  # Use for unit-testing
  gem 'rspec-rails', '~> 3.8'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
