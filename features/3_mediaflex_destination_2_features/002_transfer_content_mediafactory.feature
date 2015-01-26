Feature: Send content to Media Factory

Scenario Outline: Send ACCEPTED UID Packages to Media Factory
	Given there is a valid UUID package which is DPP compliant in Mediaflex
	And there is a PACKAGE in PRE-TX store
	And I log into Mediaflex # use sikuli here to enter login details # use sikuli to login to Mediaflex
	And I create a workflow to instruct TRANSFER process to Media Factory# use sikuli here to create workflow
	And the package status has 'Media Factory'
	When I create a new wsdl client
	And I send a SOAP request to <endpoint> with following request:
	|"send_operation"|"send_from_agent_A"|"send_from_agent_B|
	And I should get a success result from the SOAP request
	And there is a PACKAGE in POST-TX store
  Examples:
  |Package|file_type|
  |CBAX235F|mxf|

  Red B & MF
  # Send files with packages and naming conventions - TBD
  # when is the MD5 created? Signiant process? Baton? - TBD
