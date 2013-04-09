source 'https://rubygems.org'

gem 'rails', '~> 3.2.11'
gem 'devise', '~> 2.2'
gem 'devise_invitable', '~> 1.1.0'
gem 'dynamic_form', '1.1.4'

gem 'activeadmin', '~> 0.5'
gem 'sass-rails', '~> 3.2'
gem "meta_search",    '>= 1.1.0.pre'
gem 'metainspector'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'cancan'

gem 'kaminari'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '2.1.4'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
group :development do
  gem 'jazz_hands'
  gem 'letter_opener', '~> 1.1.0'
  gem 'better_errors'
end

group :test, :development do
  gem 'sqlite3', '1.3.7'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl', '2.6.4'
  gem 'fakeweb', '1.3.0'
  gem 'rspec-rails', '~> 2.13.0'
  gem 'email_spec', '1.2.1'
  gem 'database_cleaner', '0.7.2'
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg', '~> 0.14'
end