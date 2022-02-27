# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 7.0.0'
gem 'puma', '~> 5.0'
gem 'bcrypt', '~> 3.1.7'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'jwt', '~> 2.3'
gem 'pg', '~> 1.2'
gem 'rack-cors', '~> 1.1'
gem 'will_paginate', '~> 3.3'
gem 'active_model_serializers', '~> 0.10.13'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rdoc'
  gem 'psych'
  gem 'rubocop'
end

group :development do
  gem 'faker', '~> 2.19'
  gem 'sqlite3', '~> 1.4'
end
