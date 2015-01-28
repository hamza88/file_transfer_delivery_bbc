require 'find'
require 'win32ole'
require 'fileutils'
require_relative '../../../features/pages/OnAir_pages/schedule_page'
require_relative '../../../features/pages/OnAir_pages/commissions_page'
require_relative '../../../features/pages/OnAir_pages/programmes_page'

class OnAirFolderPage

  def send_commissions_to(folder)
      @folder = folder
      net = WIN32OLE.new('WScript.Network')
      user_name = "npf"
      password = "npf"
      net.MapNetworkDrive( 'h:', "\\\\fgbw1e2efs002\\metadata\\ingest\\commissions", nil,  user_name, password )
      FileUtils.cp_r("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml", "h:\\")
      rename_file('commissions')
      net.RemoveNetworkDrive( 'h:')
  end

  def rename_file(filename)
    timestamped_filename = Time.now.strftime("%y%m%d_%H%M")
    basename = "#{filename}_#{timestamped_filename}"
    # folder_path = "D:/SignianManagerTest-master/SignianManagerTest-master/features/fixtures/OnAir/OnAir/temp_xmls"
    folder_path = "h://"
    xml_files = Dir.glob(File.join(folder_path, "*.xml"))
    puts xml_files
    xml_files .each do |f|
      # File.rename(f, folder_path + "/" + basename.to_s + File.extname(f))
      File.rename(f, folder_path + basename.to_s + File.extname(f))
    end

  end

  def send_schedule_to(folder)
    @folder = folder
    net = WIN32OLE.new('WScript.Network')
    user_name = "npf"
    password = "npf"
    net.MapNetworkDrive( 'i:', "\\\\fgbw1e2efs002\\metadata\\ingest\\schedule", nil,  user_name, password )
    FileUtils.cp_r("features/fixtures/OnAir/OnAir/temp_xmls/#{$schedule_file}", "i:\\")
    rename_file('schedule')
    net.RemoveNetworkDrive( 'i:')
  end

  def send_programmes_to(folder)
    @folder = folder
    net = WIN32OLE.new('WScript.Network')
    user_name = "npf"
    password = "npf"
    net.MapNetworkDrive( 'j:', "\\\\fgbw1e2efs002\\metadata\\ingest\\programmes", nil,  user_name, password )
    FileUtils.cp_r("features/fixtures/OnAir/OnAir/temp_xmls/#{$programmes_file}", "j:\\")
    rename_file('programmes')
    net.RemoveNetworkDrive( 'j:')
  end

  # FileUtils.cp_r("\\\\fgbw1e2efs002\\metadata\\ingest\\commissions","c:\\chef-tmp")

end




