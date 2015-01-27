
Given(/^I have a valid "(.*?)" data in Xml with the following:$/) do |file_type, table|
  case file_type
    when 'Schedule'
      @schedule = SchedulePage.new
      table.rows_hash.map do |key, value|
        @schedule.add_values_to_schedule_xml(key, value)
        end
    when 'AsRun'
      @as_run = AsRunPage.new
      table.rows_hash.map do |key, value|
        @as_run.add_values_to_asrun_xml(key, value)
      end
    when 'Commissions'
      @commissions = CommissionsPage.new
      table.rows_hash.map do |key, value|
        @commissions.add_values_to_commissions_xml(key, value)
      end
  end
end

Given(/^I send an update "(.*?)" data in Xml with the following:$/) do |file_type, table|
  case file_type
    when 'Schedule'
      @schedule = SchedulePage.new
      table.rows_hash.map do |key, value|
        @schedule.update_schedule_values(key, value)
      end
    when 'Commissions'
      @commissions = CommissionsPage.new
      table.rows_hash.map do |key, value|
        @commissions.update_commissions_values(key, value)
      end
    when 'Programmes'
      @programmes = ProgrammesPage.new
      table.rows_hash.map do |key, value|
        @programmes.update_programmes_values(key, value)
      end
    when 'AsRun'
      @as_run = AsRunPage.new
      table.raw.each do |path, value|
        @as_run.update_day_type_values(path, value)
      end
  end
end


When(/^I copy "([^"]*)" file to FTP server into folder "([^"]*)"$/) do |file_type, ftp_folder|
  ftp_server = "localhost:8080"
  @ftp = FtpHelper.new(ftp_server, 'user', 'password')
  case file_type
    when 'Schedule'
      file_type = File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule.xml")
      @ftp.send_file(file_type, ftp_folder)
    when 'AsRun'
      file_type = File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule.xml")
      @ftp.send_file(file_type, ftp_folder)
      end
end

Given(/^I copy "(.*?)" file to folder "(.*?)"$/) do |xml_file, folder |
  case xml_file
    when 'Commissions'
      commissions = OnAirFolderPage.new
      commissions.send_commissions_to(folder)
    when 'Schedule'
      schedule = OnAirFolderPage.new
      schedule.send_schedule_to(folder)
    when 'Programmes'
      send_programmes_to(folder)
  end
end



