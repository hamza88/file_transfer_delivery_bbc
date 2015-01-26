require 'watir-webdriver'
require 'test/unit'

ENV['NO_PROXY']="127.0.0.1"


class WebMail
  def init_email(username, password, folder='inbox')
    @browser = Watir::Browser.new :firefox
    site = 'https://email.myconnect.bbc.co.uk/owa/'
    @browser.goto(site)
    @browser.text_field(:id => 'username').set username
    @browser.text_field(:id => 'password').set password
    @browser.button(:name => 'SubmitCreds').click
    res = @browser.url.include? ('https://email.myconnect.bbc.co.uk/owa/)')
    if res == true
      @logged_in = true
      @folder = folder
      @browser.click(@folder)
    end
  end

  def subject(text)
    assert_true @browser.div(:id => "divSubject").text == ''
    @browser.close
  end


end