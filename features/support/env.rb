require 'nokogiri'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'test/unit'
require 'time'
require 'sikuli'
require 'yaml'
require 'fileutils'
require 'test/unit/assertions'
require 'page-object'
require 'page-object/page_factory'

include Test::Unit::Assertions
ENV['NO_PROXY']="127.0.0.1"

LOGIN = YAML.load_file("config/config.yml")

Sikuli::Config.run do |config|
  config.image_path = "images\\"
  config.logging = false
  config.highlight_on_find = false
end


World(PageObject::PageFactory)


# This block is used to terminate a Test if a Scenario fails
After do |scenario|
  #puts "In After Block"

  # fail-fast
  #if ENV['FAIL_FAST']
  #Cucumber.wants_to_quit = true if scenario.failed?
  #end
end

