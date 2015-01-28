require 'yaml'
require 'watir-webdriver'
require 'test/unit'
require_relative '../../../features/support/create_package'



module MediaShuttlePage
  include PageObject

  def login_to_media_shuttle
    ENV['NO_PROXY']="127.0.0.1"
    # @browser = Watir::Browser.new :chrome
    site = 'https://bbc-fbdia-submit.mediashuttle.com/'
    @browser.goto(site)
    @browser.text_field(:id => 'login-form-email').set LOGIN['MEDIA_SHUTTLE']['USERNAME']
    @browser.text_field(:id => 'login-form-password').set LOGIN['MEDIA_SHUTTLE']['PASSWORD']
    @browser.button(:id => 'login').click
  end

  def drop_folder_to_location
    bitmap = 'add_files.png'
    my_computer = 'computer_dialog.png'
    d_drive = 'd_drive_dialog.png'
    sig_directory = 'project_dialog.png'
    sig_directory_inside = 'inside_project_dialog.png'
    features_directory = 'features_dialog.png'
    fixtures_directory = 'fixtures.png'
    packages_directory = 'packages.png'
    complete_directory = 'complete.png'
    select_package = 'package_send.png'
    file_name = 'filename.png'
    submit_files = 'submit.png'
    click_open = 'open.png'
    begin
        @screen.wait "#{bitmap}", 10
        if @screen.exists "#{bitmap}"
        @screen.click "#{bitmap}"
        @screen.doubleClick "#{my_computer}"
        @screen.doubleClick "#{d_drive}"
        @screen.doubleClick "#{sig_directory}"
        @screen.doubleClick "#{sig_directory_inside}"
        @screen.doubleClick "#{features_directory}"
        @screen.doubleClick "#{fixtures_directory}"
        @screen.doubleClick "#{packages_directory}"
        @screen.doubleClick "#{complete_directory}"
        # @screen.type "Package_#{$package_id}"
        sleep 5
        @screen.doubleClick "#{select_package}"
        sleep 5
        @screen.click "#{click_open}"
        sleep 5
        @screen.click "#{submit_files}"
          @browser.wait_until(WAIT_TIMEOUT,  "The file did not upload"){@browser.text =~ /Transfer completed/}
      end
    rescue
      fail("The following bitmap cannot be found: " + bitmap)
    end
  end

  def drop_file_to_location
    bitmap = 'add_files.png'
    my_computer = 'computer_dialog.png'
    d_drive = 'd_drive_dialog.png'
    sig_directory = 'project_dialog.png'
    features_directory = 'features_dialog.png'
    fixtures_directory = 'fixtures.png'
    packages_directory = 'packages.png'
    complete_directory = 'complete.png'
    select_pdf_file = 'add_pdf_file.png'
    submit_files = 'submit.png'
    click_open = 'open.png'
    begin
      @screen.wait "#{bitmap}", 10
      if @screen.exists "#{bitmap}"
        @screen.click "#{bitmap}"
        @screen.doubleClick "#{my_computer}"
        @screen.doubleClick "#{d_drive}"
        @screen.doubleClick "#{sig_directory}"
        @screen.doubleClick "#{features_directory}"
        @screen.doubleClick "#{fixtures_directory}"
        @screen.doubleClick "#{packages_directory}"
        @screen.doubleClick "#{complete_directory}"
        sleep 5
        @screen.doubleClick "#{select_pdf_file}"
        sleep 5
        @screen.click "#{click_open}"
        sleep 5
        @screen.click "#{submit_files}"
        @browser.wait_until(WAIT_TIMEOUT,  "The file did not upload"){@browser.text =~ /Transfer completed/}
      end
    rescue
      fail("The following bitmap cannot be found: " + bitmap)
    end
  end


end

World(MediaShuttlePage)
