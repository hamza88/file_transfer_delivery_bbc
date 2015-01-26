Given(/^a new valid UID "(.*?)" which contains:$/) do |package_id, table|
  @create_package = CreatePackage.new
  @create_package.rename_files(package_id)
  @create_package.create_directory(package_id)
  table.rows_hash.map do |type, file_type|
    @create_package.determine_files(type, file_type)
  end
end

Given(/^I use Sikuli to copy "(.*?)" to "(.*?)" landing location into folder$/) do |file_image, folder_image|
  begin
    @screen.wait "#{bitmap}", 10
    if @screen.exists "#{bitmap}"
      @screen.dragDrop("#{bitmap}", destination)
    end
  rescue
    fail("The following bitmap cannot be found: " + bitmap)
  end
end

Given(/^I use Media Shuttle to copy "(.*?)" to landing location into folder$/) do |file_type|
  case file_type
    when 'package'
      login_to_media_shuttle
     drop_folder_to_location
  end

end


Given(/^I verify "(.*?)" file is created$/) do |file_format|
  SubmissionsFolderPage.map_my_drive(file_format)

end

Given(/I verify Package exists in FBDi Store area$/) do |area|
  FbdiFolderPage.map_my_drive(area)
end



And(/^I copy to "(.*?)" landing area into folder$/) do |location|
  #   todo - need to setup access to media landing area
  #   todo - use either webdriver or sikuli
end


When(/^I repeat the steps again, for same "(.*?)"/) do |package_id|
  step "a new valid UID #{package_id} which contains:"
  step "I use Media Shuttle to copy package to landing location into folder"

end

