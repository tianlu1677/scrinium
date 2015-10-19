if ENV['USE_OFFICIAL_GEM_SOURCE']
  source 'https://rubygems.org'
else
  source 'https://ruby.taobao.org'
end

gem 'rails', '4.2.3'


## server
gem 'unicorn'
gem 'thin'

## database
gem 'pg'
gem 'redis-rails'

## view
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'

## user authentication and permissions
gem 'devise'
gem 'pundit'

# UI gems.
gem 'bootstrap-sass'
gem 'country_select'
gem 'font-awesome-rails'
gem 'bootstrap-datepicker-rails'
gem 'dropzonejs-rails'
gem 'i18n-js', '>= 3.0.0.rc11'
gem 'bower-rails'
# ActiveRecord model/data translation.
gem 'globalize', '~> 5.0.0'

## API
gem 'grape'
gem 'jbuilder', '~> 2.0'

gem 'doorkeeper'
## uploads
gem 'paperclip', '~> 4.3'
gem 'carrierwave'
gem 'mini_magick'
gem 'carrierwave-qiniu', '0.1.8'

gem 'mathjax-rails', '~> 2.5.1'
source 'https://rails-assets.org' do
  gem 'rails-assets-marked'
  gem 'rails-assets-highlightjs'
end

## others
gem 'simple_form'
gem 'impressionist'
gem 'paper_trail', '~> 4.0.0'
gem 'closure_tree'
gem 'diffy'
gem 'acts-as-taggable-on', '~> 3.4'
gem 'mailboxer'
gem 'message_bus'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'lograge'
gem 'enumerize'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'quiet_assets' #don't show assets log
  gem 'byebug'
  gem 'bullet'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'annotate'
  ## refresh browser auto
  gem 'rack-livereload'
  gem 'guard-livereload'
end

