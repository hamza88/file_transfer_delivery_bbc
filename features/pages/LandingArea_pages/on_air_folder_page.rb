require 'find'
require 'win32ole'
require 'fileutils'
require_relative '../../../features/pages/OnAir_pages/schedule_page'

module OnAirFolderPage

  def send_commissions_to(folder)
      @folder = folder
      puts @folder
      net = WIN32OLE.new('WScript.Network')
      user_name = "NATIONAL\\razzah01"
      password = "Monday123"
      net.MapNetworkDrive( 'l:', "\\\\fgbw1e2efs002\\metadata\\ingest\\commissions", nil,  user_name, password )
      commissions_path = ''
      Dir.foreach('l:\\') { |entry|
        if File.directory?("l:\\#{entry}")
          puts entry
          package_path << entry if entry =~ /#{$schedule_file}/
          puts package_path
          raise() if entry =~ nil
        end
      }
    end


  FileUtils.cp_r("\\\\fgbw1e2efs002\\metadata\\ingest\\commissions","c:\\chef-tmp")


  end
  World(FbdiFolderPage)


end




