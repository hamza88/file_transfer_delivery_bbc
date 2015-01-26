require 'net/ftp'

class FtpHelper
  
  def initialize(ftp_server, user, password)
    @ftp_conn = Net::FTP.new(ftp_server)
    @ftp_conn.passive = true
    @username = user
    @pswd = password
  end

  def send_file(file_type, folder)
    @ftp_conn.login(user=@username,passwd=@pswd)
    @ftp_conn.chdir(folder)
    @ftp_conn.debug_mode = true
    @ftp_conn.putbinaryfile(file)
    @ftp_conn.close
  end

  def file_exists(version, folder)
    @ftp_conn.login(user=@username,passwd=@pswd)
    files = @ftp_conn.list('/'+folder)
    @ftp_conn.close

    result = false
    files.each { |element|
      result = element.include? filename
      if result
        break
      end
    }
    result
  end
end