source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.7.1'
# Use Bootstrap via this gem
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyrhino'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'carrierwave'
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'

gem 'thin'
# webrick has an issue with content-length and it breaks the JS in safari

gem 'sucker_punch', '~> 2.0'
# sucker punch for running jobs async, in-process


gem 'health-data-standards', git: 'https://github.com/projectcypress/health-data-standards.git', branch: 'mongoid5'
gem 'quality-measure-engine',
    git: 'https://github.com/projectcypress/quality-measure-engine.git', branch: 'bump_mongoid'
gem 'go-cda-tools', git: 'https://github.com/projectcypress/go-cda-tools.git', branch: 'master'
# gem 'go-cda-tools', path: '../go-cda-tools'

# gem "bson"
# gem "moped", github: "mongoid/moped"

gem 'font-awesome-sass'

gem 'rubyzip'

#clean up the stdout logs, doesn't affect the log/access.log and log/error.log
gem "lograge"

# necessary to prevent cache-busting of the bootstrap fonts
gem "non-stupid-digest-assets"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'bundler-audit'
end

group :production do
  gem 'unicorn-rails'
  gem 'newrelic_rpm'
end
