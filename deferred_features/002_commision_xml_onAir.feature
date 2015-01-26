Feature: Project update XML, as OnAir Commissions, imported to Mediaflex

Scenario: View Planned Commissions in Mediaflex with data populated
 Given I update a valid "Commissions" data in Xml with the following:
  | Delivery_Date | Video_Source|UID        |
  | +90 days      | FD          |CBIC309Y/01|
 When I copy "Commissions" file to FTP server into folder "location"
#  And the data is imported into Mediaflex - need to verify whether workflow is required for data import or signiant agent.
 And I log into Mediaflex
 When I search for UID
 Then I should see Commissions data visible in Mediaflex