# spec_helper.rb
require 'spec_helper'
require 'factory_bot_rails'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# Add FactoryBot syntax methods
require 'factory_bot_rails'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end


require 'support/database_cleaner_addstudents'

# Other configurations...
