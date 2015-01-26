require "watir-webdriver/extensions/alerts"
class BrowserDriver
  attr_accessor :browser

  def initialize
    Watir::always_locate = true
    @browser = Watir::Browser.new #:firefox
  end

  def method_missing(method_name, identifier = nil)
    identifier.nil? ? @browser.send(method_name) : @browser.send(method_name, identifier)
  end

  def confirm(bool, &blk)
    @browser.execute_script "window.confirm = function(msg) { window.__lastWatirConfirm = msg; return #{!!bool} }"
    begin
      yield
    rescue
      # nothing
    end
    @browser.execute_script "return window.__lastWatirConfirm"
  end


end