# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.2.2"

# 🚀 Rails y base de datos
gem 'rails', '~> 7.1.3'
gem 'pg', '~> 1.4'
gem 'puma', '~> 6.6'
gem 'bootsnap', '>= 1.18.6', require: false
gem 'sprockets-rails', '~> 3.5'
gem 'psych', '~> 4.0', platforms: [:ruby]


# 🌐 JS y CSS
gem 'jsbundling-rails'       # Manejo de JS moderno (esbuild, etc.)
gem 'tailwindcss-rails', '~> 4.3'

# 🤖 IA / LLM
gem 'openai', '~> 0.20.0'

# 🧪 Desarrollo y pruebas
group :development, :test do
  gem 'rspec-rails', '~> 6.1'
  gem 'factory_bot_rails', '~> 6.5'
  gem 'faker', '~> 3.5'
  gem "dotenv-rails", groups: [:development, :test]
  gem 'simplecov', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'listen', '~> 3.7'
  gem 'spring'
  gem 'foreman'   # Necesario para bin/dev
end

group :test do
  gem 'capybara', '>= 3.39'
  gem 'webdrivers'
end
