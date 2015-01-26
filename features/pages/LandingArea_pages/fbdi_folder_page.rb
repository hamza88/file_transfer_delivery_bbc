require 'find'
require 'win32ole'
require_relative '../../../features/support/create_package'


module FbdiFolderPage

  def map_my_drive

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



end
World(FbdiFolderPage)