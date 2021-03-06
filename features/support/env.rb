ENV["RAILS_ENV"] = "cucumber"

require 'dotenv'
Dotenv.load
require 'net/http'
require 'rspec/expectations'
require 'json'
require './secrets'
require 'capybara/cucumber'
require 'json-schema'

require './features/support/helpers'
require 'erb'
require 'pry'

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 20  # Because the eg is sloooooooow

$logger = Logger.new("features/support/logs/logfile.log")
