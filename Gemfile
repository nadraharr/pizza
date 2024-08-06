source "https://rubygems.org"

gem "rails", "~> 7.2.0.beta3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "bootstrap", "~> 5.3.3"
gem "sassc-rails"
gem "font-awesome-sass"
gem "devise", "~> 4.9", ">= 4.9.2"
gem "omniauth-google-oauth2", "~> 1.1", ">= 1.1.2"
gem "omniauth-rails_csrf_protection"
gem "pundit", "~> 2.3", ">= 2.3.2"
gem "devise-guests", "~> 0.8.3"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false

  gem "rspec-rails", "~> 6.1.0"
end

group :development do
  gem "web-console"
end
