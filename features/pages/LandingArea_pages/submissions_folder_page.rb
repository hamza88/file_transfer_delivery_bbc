require 'find'
require 'win32ole'

module SubmissionsFolderPage

  def verify_files_exist(file_format)
    @md5_file_paths = ''
    Find.find("../../../features/fixtures/packages") do |path|
      @md5_file_paths << path if path =~ /.*\.#{file_format}$/
      puts @md5_file_paths
    end
  end

  def map_my_drive(file_format)
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
World(SubmissionsFolderPage)