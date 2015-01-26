@WIP @Release2
Scenario: Send INVALID Package/Filetypes to Mediaflex using Signiant Manager/Agent and verify package rejected at Mediaflex
  Given a VALID <Package> with a <file_type>
  And I copy <Package> to FTP server "10.173.2.50" into folder "PATH\TO\FOLDER"
  And I create a new wsdl client
  And I send a SOAP request to <endpoint> with following request:
  |"send_operation"|"send_from_agent_A"|"send_from_agent_B|
  And I should get a success result from the SOAP request
  And I verify that the package has renamed to version in folder "PATH\TO\FOLDER" of ftp server "10.173.2.50"
  And I log into Mediaflex # use sikuli here to enter login details 
  When I create a workflow to instruct DPP Comliant process # use sikuli here to create workflow
  Then a notification is sent out to email address "unsuccess@test.com"
  When I re-create the steps again
  Then a notification is sent out to email address "unsuccess@test.com"
  And the Package is deleted from location
Examples:
  |Package|file_type|
  |INVALID_UUID|mxf|
  |CBAX236F|INVALID_FILE|