Feature: Project update XML, OnAir Schedule imported to Mediaflex

@happy_path
Scenario: As an MST user, I should be able to View Standby Schedule data in Mediaflex, Verify ALL data populated
  Given I have a valid "Schedule" data in Xml with the following:
    |Day_Type          | Standby     |
    |On_Date           | +10         |
    |UID               | CBIC309Y/0 |
    |Event_ID          | 87989635     |
    |Version_Number    | 01           |
    |Channel           | bbc1       |
    |Start_Time        | 17:00:24   |
    |Billed_Time       | 17:00:00   |
    |Confidentiality   | +10        |
    |Video_Source      | FD         |
    |Smoke_Screen_Flag | hidden     |
    |Core_Number       | false      |
  When I copy "Schedule" file to FTP server into folder "location"
  Given I log into Mediaflex
  And I create a new workflow for Schedule transfer
  And the data is imported into Mediaflex
  When I search for UID "CBIC309Y/0"
  Then I should see schedule data visible in Mediaflex
  And I verify DAY_TYPE as "Standby"
  And I verify On_Date as "+10"
  And I verify Video_Source as "FD"
  And I verify UID as "CBIC309Y/0"
  And I verify Event_ID as "87989635"
  And I verify Version_Number as "01"
  And I verify Channel as "bbc1"
  And I verify Start_Time as "17:00:24"
  And I verify Billed_Time as "17:00:00"
  And I verify Confidentiality as "+10"
  And I verify Video_Source as "FD"
  And I verify Smoke_Screen_Flag as "hidden"
  And I verify Core_Number as "false"


Scenario: As an MST user, I should be able to View Planned Schedule data in Mediaflex with data populated
  Given I update a valid "Schedule" data in Xml with the following:
  |Day_Type       | Planned   |
  |On_Date        | +10       |
  |Video_Source   | FD        |
  |UID            | CBIC309Y/0|
 When I copy "Schedule" file to folder "location" # check with stuart
  Given I log into Mediaflex
  And I create a new workflow for Schedule transfer
  And the data is imported into Mediaflex
  When I search for UID "CBIC309Y/0"
  Then I should see schedule data visible in Mediaflex
  And I verify Day_Type as "Planned"
  And I verify On_Date as "+10"
  And I verify Video_Source as "FD"
  And I verify UID as "CBIC309Y/0"


Scenario: As an MST user, I should be able to View Standby Schedule data in Mediaflex with data populated
  Given I update a valid "Schedule" data in Xml with the following:
    | DAY_TYPE   |Standby   |
    |On_Date     |  +10     |
    |Video_Source|FD        |
    |UID         |CBIC309Y/0|
  When I copy "Schedule" file to folder "location" # check with stuart
  Given I log into Mediaflex
  And I create a new workflow for Schedule transfer
  And the data is imported into Mediaflex
  When I search for UID "CBIC309Y/0"
  Then I should see schedule data visible in Mediaflex
  And I verify Day_Type as "Standby"
  And I verify On_Date as "+10"
  And I verify Video_Source as "FD"
  And I verify UID as "CBIC309Y/0"



Scenario: As an MST user, I should be able to View Standby Schedule data in Mediaflex with data populated, then send an Update Day_Type to planned.
  Given I have a valid "Schedule" data in Xml with the following:
    |Day_Type          | Standby     |
    |On_Date           | +10         |
    |UID               | CBIC309Y/0 |
    |Event_ID          | 87989635     |
    |Version_Number    | 01           |
    |Channel           | bbc1       |
    |Start_Time        | 17:00:24   |
    |Billed_Time       | 17:00:00   |
    |Confidentiality   | +10        |
    |Video_Source      | FD         |
    |Smoke_Screen_Flag | hidden     |
    |Core_Number       | false      |
  When I copy "Schedule" file to folder "location" # check with stuart
  Given I log into Mediaflex
  And I create a new workflow for Schedule transfer
  And the data is imported into Mediaflex
  When I search for UID "CBIC309Y/0"
  Then I should see schedule data visible in Mediaflex
  And I verify Day_Type as "Standby"
  Given I update a valid "Schedule" data in Xml with the following:
    |DAY_TYPE          |Planned         |
    |UID               | CBIC309Y/0     |
  When I copy "Schedule" file to folder "location" # check with stuart
  When I search for UID "CBIC309Y/0"
  Then I should see schedule data visible in Mediaflex
  And the data is imported into Mediaflex
  And I verify Day_Type as "Planned"
  And I verify UID as "CBIC309Y/0"


Scenario: As an MST user, I should be able to View Standby Schedule data in Mediaflex with data populated, then send an Update Channel to BBC2.
  Given I have a valid "Schedule" data in Xml with the following:
    |Day_Type          | Standby     |
    |On_Date           | +10         |
    |UID               | CBIC309Y/0 |
    |Event_ID          | 87989635     |
    |Version_Number    | 01           |
    |Channel           | bbc1       |
    |Start_Time        | 17:00:24   |
    |Billed_Time       | 17:00:00   |
    |Confidentiality   | +10        |
    |Video_Source      | FD         |
    |Smoke_Screen_Flag | hidden     |
    |Core_Number       | false      |
  When I copy "Schedule" file to folder "location" # check with stuart
  Given I log into Mediaflex
  And I create a new workflow for Schedule transfer
  And the data is imported into Mediaflex
  When I search for UID "CBIC309Y/0"
  Then I should see schedule data visible in Mediaflex
  And I verify Day_Type as "Standby"
  Given I update a valid "Schedule" data in Xml with the following:
    |Channel           |bbc2         |
    |UID               | CBIC309Y/0     |
  When I copy "Schedule" file to folder "location" # check with stuart
  When I search for UID "CBIC309Y/0"
  Then I should see schedule data visible in Mediaflex
  And the data is imported into Mediaflex
  And I verify UID as "CBIC309Y/0"
  And I verify Channel as "bbc2"

Scenario: As an MST user, I should be able to View Schedule data in Mediaflex with data populated - where OnDate is later than 10 days
  Given I update a valid "Schedule" data in Xml with the following:
    |Day_Type       | Planned   |
    |On_Date        | +11       |
    |Video_Source   | FD        |
    |UID            | CBIC309Y/0|
  When I copy "Schedule" file to FTP server into folder "location"
  Given I log into Mediaflex
  When I create a new workflow for Schedule transfer
  And the data fails to import into Mediaflex - verify behaviour with TMD


Scenario: As an MST user, I should be able to View Schedule data in Mediaflex with data populated - where OnDate is earlier than 10 days
  Given I update a valid "Schedule" data in Xml with the following:
    |Day_Type       | Planned   |
    |On_Date        | +9       |
    |Video_Source   | FD        |
    |UID            | CBIC309Y/0|
  When I copy "Schedule" file to FTP server into folder "location"
  Given I log into Mediaflex
  When I create a new workflow for Schedule transfer
  And the data is imported into Mediaflex  And the data fails to import into Mediaflex - verify behaviour with TMD




