require 'find'
require 'win32ole'
require_relative '../../../features/support/create_package'


module FbdiFolderPage

  def map_my_drive_and_search_fbdi_store

    net = WIN32OLE.new('WScript.Network')
    user_name = "NATIONAL\\razzah01"
    password = "Monday123"
    net.MapNetworkDrive( 'k:', "\\\\fgbw1e2efs002\\submissions\\FBDi_STORE", nil,  user_name, password )
    package_path = ''
    Dir.foreach('k:\\') { |entry|
      if File.directory?("k:\\#{entry}")
        puts entry
        package_path << entry if entry =~ /#{$package_id}/
        puts package_path
        raise() if entry =~ nil
      end
    }
  end


  def map_my_drive_and_search_submissions(file_format)
    net = WIN32OLE.new('WScript.Network')
    user_name = "NATIONAL\\razzah01"
    password = "Monday123"
    net.MapNetworkDrive( 'k:', "\\\\fgbw1e2efs002\\submissions\\inbox", nil,  user_name, password )
    md5_file_paths = ''
    Dir.foreach('k:\\') { |entry|
      if File.directory?("k:\\#{entry}")
        puts entry
        md5_file_paths << entry if entry =~ /.*\.#{file_format}$/
        puts md5_file_paths
      end
    }
  end



end
World(FbdiFolderPage)