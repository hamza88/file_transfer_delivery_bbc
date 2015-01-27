require 'rubygems'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'time'
require 'fileutils'
require 'win32/screenshot'

ENV['NO_PROXY']="127.0.0.1"


ENV['HTTP_PROXY'] = nil
ENV['http_proxy'] = nil
ENV['NO_PROXY'] = ENV['no_proxy'] = '127.0.0.1'

# Profile/Driver related declared here
profile = Selenium::WebDriver::Remote::Http::Default.new
profile.timeout = 3000 # seconds – default is 60

# Configure Driver settings here
# client = Selenium::WebDriver::Firefox::Profile.new
# client = Selenium::WebDriver.for(:firefox, :profile => "Test")
client = Selenium::WebDriver::Firefox::Profile.from_name "default"
client["network.proxy.type"] = 5
client['javascript.enabled'] = true
client["--enable-plugins"] = 0
client['pdfjs.disabled'] = true
client['native_events'] = true
# client["add_extension"] = ("C:/Users/razzah01/AppData/Roaming/Mozilla/Firefox/Profiles/a4vh0ulx.default/extensions/firebug@software.joehewitt.com.xpi")
# client.add_extension("C:/Users/razzah01/AppData/Roaming/Mozilla/Firefox/Profiles/a4vh0ulx.default/extensions/firebug@software.joehewitt.com.xpi")

# Try out below but failed
# client.proxy = Selenium::WebDriver::Proxy.new :http => 'www-cache.reith.bbc.co.uk:80';


browser_type = ENV['browser']
unless browser_type == nil then
  puts "Browser used: #{browser_type}"
else
  puts "Browser used: Default"
end

case ENV['browser']
  when 'chrome' then
    browser = Watir::Browser.new :chrome, :profile => client, :http_client => profile
  when 'firefox' then
    browser = Watir::Browser.new :firefox, :profile => client, :http_client => profile
  else
    browser = Watir::Browser.new :firefox, :profile => client, :http_client => profile
end

Before do
  ENV['NO_PROXY']="127.0.0.1"
  FileUtils.rm_rf(Dir.glob('features/fixtures/packages/complete_packages/*'))
  FileUtils.rm_rf(Dir.glob('features/fixtures/OnAir/OnAir/temp_xmls/*'))
  @browser = browser
end

# After do |scenario|
#   if scenario.failed?
#     Win32::Screenshot::Take.of(:foreground).write("results/#{scenario.name}.png")
#     embed("#{scenario.name}.png", "image/png", "Screenshot of error during '#{scenario.name}")
#   end
# end


at_exit do
  browser.close
  @browser.close if @browser.respond_to?(:close)
end



class SikuliNavigator
  def initialize
    #if (defined?(@screen)).nil?
    #    @screen.destroy()
    #end
    @screen = Sikuli::Screen.new                  # from the sikuli gem
    puts "************************************************"
  end
end

World { SikuliNavigator.new }




