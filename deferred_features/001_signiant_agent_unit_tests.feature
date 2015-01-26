@unit_test
Feature: As a MST user,
 And I post a SOAP request instructing SIGNIANT to instruct agent to agent transfer

Scenario: SOAP request instructing SIGNIANT to instruct agent to agent transfer, when agent is unavailable
  Given I create a new wsdl client
  When I send a SOAP request to <endpoint> with following request:
  |"send_operation"|"send_from_agent_A"|"unavailable_agent"|
  Then I should get a unsuccessful result from the SOAP request

Scenario: SOAP request instructing SIGNIANT to instruct agent to agent transfer, when agent is available
  Given I create a new wsdl client
  When I send a SOAP request to <endpoint> with following request:
  |"send_operation"|"send_from_agent_A"|"unavailable_agent"|
  Then I should get a successful result from the SOAP request