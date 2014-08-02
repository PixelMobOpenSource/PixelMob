if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'
gem 'rails', '4.0.0'
## Mongoid - Start
gem 'bson_ext'
gem 'mongo', '1.9.1'
gem 'mongoid', :git => 'https://github.com/mongoid/mongoid.git', :ref => '85e146637503522939b3a6b942c84d1bbc55c00a'
gem 'mongoid_token', '~> 2.0.0', :git => 'https://github.com/apai4/mongoid_token.git'
gem 'mongoid-elasticsearch'

#gem 'mongoid_fulltext'
## Mongoid - End
gem 'foreman'
gem 'guard'
gem 'guard-livereload'
gem 'puma'
gem 'rmagick'
gem 'pry-rails'
gem 'launchkey', :github  => 'wisesascha/launchkey-ruby'
gem 'httparty'
gem 'figaro'
gem 'faye'
gem 'redis'
gem "eventmachine"
## Assets - Start
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'haml-rails'
end


gem "font-awesome-rails"
gem 'jquery-rails'
## Assets - End
gem 'devise', :github => 'plataformatec/devise', :branch => 'rails4', :ref => '6b5988d756d780903bf8c9ccb3e2b3b724ccebe8'
gem 'active_model_serializers', :github => 'rails-api/active_model_serializers'
gem 'sanitize'
gem 'gravtastic'
## Sidekiq - Start
gem 'sidekiq'
gem 'slim'
gem 'sinatra', '>= 1.3.0', :require => nil

## Sidekiq - End
## Tests - Start
gem "rspec-rails", :group => [:test, :development]
gem 'forgery', '0.5.0'
gem "factory_girl_rails"
gem 'simplecov'
gem 'simplecov-teamcity-summary'
gem 'capybara'
## Tests - End

## Glimpse - Start
## Glimpse - End

## Carrierwave - Start
gem 'carrierwave'
gem 'carrierwave-video', :github => 'wisesascha/carrierwave-video', :ref => '3045ed4ff4e803e6507c96619d9a8e4d44f4c006'
gem 'carrierwave-video-thumbnailer'
gem 'carrierwave_backgrounder'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'streamio-ffmpeg'
## Carrierwave - End

## BetterErrors - Start
group :development do
	gem "better_errors"
	gem "binding_of_caller"
end
## BetterErrors - End
gem "faraday"
gem "omniauth"
gem "omniauth-clef"
