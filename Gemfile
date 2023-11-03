# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7.1.0'
gem 'puma'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'pg'
gem 'rack-cors'
gem 'devise'
gem 'devise-jwt'
gem 'pagy'
gem 'pundit'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop'
  gem 'rubocop-rails', require: false
  gem 'figaro'
end

group :development do
  gem 'faker', '~> 2.19'
  gem 'sqlite3', '~> 1.4'
end
