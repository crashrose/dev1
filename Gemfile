source 'https://rubygems.org'

### Core Rails Framework
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'sprockets-rails', '2.1.3'


#### Database Tools
# Use mysql as the database for Active Record
# gem 'mysql2'
gem 'pg', '~> 0.17.1'
gem "activerecord-tableless", "~> 1.0"
gem "schema_plus", '~> 1.5.3'
gem 'rails_12factor', group: [:production] #required by Heroku
# gem 'active_record-acts_as'
gem 'acts_as_relation', '~> 1.0'


### Multitenancy
gem 'acts_as_tenant', '~> 0.3.6'

gem "nested_form", '~> 0.3.2'
gem "cocoon", '~> 1.2.0'



#### Administration
# gem 'activeadmin', github: 'gregbell/active_admin'  ## Will reinstall
# gem 'activeadmin'#, '~> 0.6.3' 40ac6655d67e   40ac6655d67eece5f43f72ff6137db1ba34aa711
gem 'activeadmin', github: 'activeadmin', :ref => '40ac6655d67eece5f43f72ff6137db1ba34aa711'#, branch: 'master'
# gem 'activeadmin-sortable'
gem 'activeadmin-sortable', '~> 0.0.3'
gem 'acts_as_list', '~> 0.4.0'
gem 'acts-as-taggable-on', '~> 3.4.1'


#### Authentication
# gem 'devise'#, github: 'plataformatec/devise', :branch => 'lm-timeoutable-fix'
gem 'devise', '~> 3.4.0'
# gem "cancan"
gem 'cancan', '~> 1.6.10'
# gem 'certified', '~> 0.1.2' ## Not sure if needed
# gem 'signet-rails', '>= 0.0.6' ## Not needed since 'signet' gem is installed by Google API
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7' ## Not sure if needed - I believe this is for password encryption


#### Formatting Tools
gem 'json', '~> 1.8.1'
# gem 'formtastic', '~> 2.3.0.rc2'
# gem 'formtastic', '~> 3.0.0'
gem 'simple_form', '~> 3.1.0.rc2'
gem 'bootstrap-sass', '~> 3.2.0.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# gem 'formtastic-bootstrap' ### Not sure if needed
# gem 'compass-rails' ### Not sure if needed
gem 'purecss', '~> 0.5.0.1'

gem 'datetimepicker-rails', :git => 'git://github.com/zpaulovics/datetimepicker-rails.git', :branch => 'master', :submodules => true
# gem 'simple_form', '>= 3.1.0.rc1'
# gem 'momentjs-rails', '~> 2.8.1' - required by datetimepicker-rails


#### JavaScript tools
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.2'
gem 'jquery-ui-rails', '~> 5.0.0'
gem 'jquery-rest-rails', '~> 1.0.0'
# Java date selection
gem 'momentjs-rails', '~> 2.8.1'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem "select2-rails", '~> 3.5.9.1'


#### Data/Translation Reference Tools
gem 'country_select', '~>2.0.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2014.7', platforms: [:mingw, :mswin]
# gem 'timezone' ## Not sure if needed
# gem 'geocoder'
# gem 'gmaps-autocomplete-rails'


### APIs
# Google API
gem 'google-api-client', '~> 0.7.1', :require => 'google/api_client'
# PayPal API
# gem 'paypal-sdk-rest' ## Not currently needed - may be useful in later features
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'



#### Feature Tools
# File Management
gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'rails-file-icons', '~> 0.0.1'
# Calendar Builder (Java-based)
gem 'fullcalendar-rails', '~> 1.6.4.0'
# gem "meta_search" ## Not sure if needed or is best option - maybe Ransack

#### Navigation
gem 'tabulous', '~> 2.1.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.3.0'


#### Asset Pipeline Tools
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# gem 'autoprefixer-rails' ## Not sure if needed


### Web Server Tools
# gem 'unicorn' ## Linux only -- sticking with WEBrick, at least for current dev on Windows
# Required for Scout's "Ruby on Rails Monitoring" tool
gem 'elif', '~> 0.1.0'
gem 'request-log-analyzer', '~> 1.13.0'

#### Deployment Tools
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


#### Development Tools
# group :development do
	gem 'sextant', '~> 0.2.4'
	gem 'better_errors', '~> 1.1.0'
	gem "binding_of_caller", '~> 0.7.2'
	gem 'meta_request', '~> 0.3.4'
# end
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Use debugger
gem 'debugger', '~> 1.6.8', group: [:development]

