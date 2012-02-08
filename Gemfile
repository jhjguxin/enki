source 'http://rubygems.org'

#gem 'rails', '3.0.4'
#gem "rails", "~> 3.0.11"
gem "rails", "~> 3.1.3"
gem 'rake', '~> 0.9.2.2'
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

group :assets do
  gem 'sass-rails', '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end


gem 'twitter-bootstrap-rails'
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
gem "google-analytics-rails", "~> 0.0.1"
# permission
gem 'cancan', '1.4.1'

# paginate
#gem 'will_paginate', '3.0.2'
gem "rails_paginate", "~> 0.0.7"

gem "paperclip", "~> 2.0"
gem 'jquery-rails', '1.0.12'
gem 'remotipart', '~> 1.0'

#A thin and fast web server
gem "thin", "~> 1.3.1"
#git api
gem "github_api", "~> 0.4.1"


# 全文搜索 sunspot 是一个java程序 在heroku中使用需要付费这里可以使用naive-search替代
gem 'sunspot_rails', "~> 1.3.0"
#if sunspot not running currected there will "Errno::ECONNREFUSED (Connection refused - connect(2)): "
#rake sunspot:solr:start RAILS_ENV=production rake sunspot:solr:start
#you only need to do a full reindex if you’ve added or changed a searchable definition for a model.
#rake sunspot:reindex
gem "progress_bar", "~> 0.4.0"
#heroku run:detached rake sunspot:solr:start RAILS_ENV=production rake sunspot:solr:start --app francisjiang
gem 'sunspot_solr'
#gem "naive-search", "~> 0.1.8"
#麵包屑
gem "breadcrumbs_on_rails", "~> 2.1.0"

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
