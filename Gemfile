source 'https://gems.ruby-china.org'
ruby "2.5.0"

#gem 'rails', '3.0.4'
#gem "rails", "~> 3.0.11"
gem "rails", "~> 4.2.1"
gem 'rake'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

platforms :ruby do
  gem 'sqlite3'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'trinidad'
  gem 'jruby-openssl'
end

gem 'sprockets'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem 'bootstrap'
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
#gem 'ruby-debug' # for ruby 1.8

# Bundle the extra gems:
gem 'RedCloth', :require => 'redcloth'
gem 'ruby-openid', :require => 'openid'
gem 'acts-as-taggable-on'
gem 'gravatar_image_tag'
gem 'lesstile'
gem 'rack-openid', :require => 'rack/openid'
gem 'aaronh-chronic', :require => 'chronic' # Fixes for 1.9.2
gem "coderay"
#gem 'lesstile'
gem 'formtastic'

gem 'devise'
gem 'devise-i18n'
gem 'devise-token_authenticatable'

gem "google-analytics-rails"
# permission
gem 'cancan'

# paginate
#gem 'will_paginate', '3.0.2'
gem "rails_paginate"

gem "paperclip"
gem 'jquery-rails'
gem 'remotipart'

#A thin and fast web server
gem "thin"
#git api
gem "github_api"
#The Exception Notifier plugin provides a mailer object and a default set of templates for sending email notifications when errors occur in a Rails application.
gem "exception_notification"

# 全文搜索 sunspot 是一个java程序 在heroku中使用需要付费这里可以使用naive-search替代
gem 'sunspot_rails'
#if sunspot not running currected there will "Errno::ECONNREFUSED (Connection refused - connect(2)): "
#rake sunspot:solr:start RAILS_ENV=production rake sunspot:solr:start
#you only need to do a full reindex if you’ve added or changed a searchable definition for a model.
#rake sunspot:reindex
#gem "progress_bar", "~> 0.4.0"
#heroku run:detached rake sunspot:solr:start RAILS_ENV=production rake sunspot:solr:start --app francisjiang
gem 'sunspot_solr'

#麵包屑
gem "breadcrumbs"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :test do
  gem 'cucumber-rails'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'webrat'
  gem 'factory_bot'
  gem 'rspec'
  gem 'rspec-rails'
  #curl -OL http://rubyforge.org/frs/download.php/75414/linecache19-0.5.13.gem
  #curl -OL http://rubyforge.org/frs/download.php/75414/linecache19-0.5.13.gem
  #curl -OL http://rubyforge.org/frs/download.php/75415/ruby-debug-base19-0.11.26.gem
  #gem install linecache19-0.5.13.gem -- --with-ruby-include="${MY_RUBY_HOME/rubies/src}"
  #gem install ruby-debug-base19-0.11.26 -- --with-ruby-include="${MY_RUBY_HOME/rubies/src}"


  #other case
  #gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
  #gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  #gem 'ruby-debug19'

end
