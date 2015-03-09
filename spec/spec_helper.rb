ENV['RACK_ENV'] = 'test'

require './app/server'
require 'database_cleaner'
require 'capybara/rspec'

Capybara.app = Server

RSpec.configure do |config|

  # Set up database_cleaner

end
