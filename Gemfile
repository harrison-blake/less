source "https://rubygems.org"

gem "rails", "~> 8.0.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "bootsnap", require: false
gem "propshaft"
gem "bcrypt", "~> 3.1.7"

gem "jsbundling-rails", "~> 1.3"
gem "cssbundling-rails", "~> 1.4"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Omakase Ruby + Rails linting style
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

# Windows timezone support
gem "tzinfo-data", platforms: %i[ windows jruby ]
