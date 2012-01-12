source 'http://rubygems.org'

gem 'rails', '3.0.4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

platforms :ruby do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'trinidad'
  gem 'jruby-openssl'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'ruby-debug'

# Bundle the extra gems:
gem 'RedCloth', '~> 4.2.7', :require => 'redcloth'
gem 'ruby-openid', :require => 'openid'
gem 'rack-openid', :require => 'rack/openid'
gem 'aaronh-chronic', :require => 'chronic' # Fixes for 1.9.2
gem "coderay", "~> 1.0.5"
#gem 'lesstile'
gem 'formtastic'

gem 'devise', '~> 1.1.5'
#gem "rack-google_analytics", "~> 1.0.2"
# permission
gem 'cancan', '1.4.1'

# paginate
#gem 'will_paginate', '3.0.2'
gem "rails_paginate", "~> 0.0.7"
# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'cucumber-rails'
  gem 'webrat'
  gem 'factory_girl'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'nokogiri', '~> 1.5.0'
end
