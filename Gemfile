source 'https://rubygems.org'

### Core Rails Framework
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'sprockets-rails', '2.1.3'


#### Database Tools
# Use mysql as the database for Active Record
# gem 'mysql2'
gem 'pg'
gem "activerecord-tableless", "~> 1.0"
gem "schema_plus"


#### Administration
gem 'activeadmin', github: 'gregbell/active_admin'  ## Will reinstall
gem 'activeadmin-sortable'
gem 'acts_as_list'
gem 'acts-as-taggable-on'


#### Authentication
gem 'devise', github: 'plataformatec/devise', :branch => 'lm-timeoutable-fix'
gem "cancan"
# gem 'certified', '~> 0.1.2' ## Not sure if needed
# gem 'signet-rails', '>= 0.0.6' ## Not needed since 'signet' gem is installed by Google API
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7' ## Not sure if needed - I believe this is for password encryption


#### Formatting Tools
gem 'json'
gem 'formtastic', '~> 2.3.0.rc2'
gem 'bootstrap-sass'#, '~> 3.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# gem 'formtastic-bootstrap' ### Not sure if needed
# gem 'compass-rails' ### Not sure if needed
gem 'purecss'


#### JavaScript tools
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-rest-rails'
# Java date selection
gem 'momentjs-rails', '~> 2.7.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'


#### Data/Translation Reference Tools
gem 'country_select', '~>2.0.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
# gem 'timezone' ## Not sure if needed
# gem 'geocoder'
# gem 'gmaps-autocomplete-rails'


### APIs
# Google API
gem 'google-api-client', :require => 'google/api_client'
# PayPal API
# gem 'paypal-sdk-rest' ## Not currently needed - may be useful in later features
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'



#### Feature Tools
# File Management
gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'rails-file-icons'
# Calendar Builder (Java-based)
gem 'fullcalendar-rails', '~> 1.6.4.0'
# gem "meta_search" ## Not sure if needed or is best option - maybe Ransack

#### Navigation
gem 'tabulous'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'


#### Asset Pipeline Tools
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# gem 'autoprefixer-rails' ## Not sure if needed


### Web Server Tools
# gem 'unicorn' ## Linux only -- sticking with WEBrick, at least for current dev on Windows
# Required for Scout's "Ruby on Rails Monitoring" tool
gem 'elif', '~> 0.1.0'
gem 'request-log-analyzer'

#### Deployment Tools
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


#### Development Tools
group :development do
	gem 'sextant'
	gem 'better_errors', '~> 1.1.0'
	gem "binding_of_caller"
	gem 'meta_request'
end
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Use debugger
gem 'debugger', group: [:development, :test]

