# Given(/^I copy files "([^"]*)" to FTP server "([^"]*)" into folder "([^"]*)"$/) do |file, ftp_server, ftp_folder|
#   @ftp = FtpHelper.new(ftp_server, 'user', 'password')
#   @ftp.send_file(file, ftp_folder)
# end

Given /^I create a new wsdl client$/ do
   @client = Savon::Client.new do
     wsdl.document = "http://service.example.com?wsdl"
   end
end

When(/^I send a SOAP request to (.*) with following request:$/) do |endpoint, table|
  xml = operation_name table.hashes[0]
  @soap_response = @client.request :wsdl, request do |soap|
    soap.body = xml.target!
  end
end

Then(/^I should get a (successful|unsuccessful) result from the SOAP request$/) do
  @soap_response.success?.should == true
  @soap_response.soap_fault?.should == false
  @soap_response.http_error?.should == false
end


And(/^I verify that the package has renamed to version (.*) in folder "([^"]*)" of ftp server "([^"]*)"$/) do |version, folder, ftp_server|
      ftp = FtpHelper.new(ftp_server, 'username', 'password')
      assert ftp.file_exists(version, folder)
end

def operation_name address
    xml =  Builder::XmlMarkup.new(:indent => 2) 
    xml.credentials{
        xml.token(TOKEN)
        xml.password(AUTH_PASS)
      }
      xml.address{
        xml.structuredAddress{
          xml.street{
            xml.streetName(address["street_name"]) 
            xml.streetType(address["street_type"]) 
            xml.streetSuffix(address["street_suffix"])
          }
          xml.streetNumber(address["street_number"]) 
          xml.suburb(address["suburb"])
          xml.state(address["state"])
          xml.postcode(address["postcode"])
        }
      }
    return xml
end