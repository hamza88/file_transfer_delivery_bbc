Feature: As a MST user,
I FTP file to server location
and I verify INVALID values are NOT imported to Mediaflex


Scenario: Import Schedule data with NULL Values
Given I have a valid "Schedule" data in Xml with the following:
  |Day_Type       | NULL     |
  |On_Date        | NULL     |
  |Video_Source   | NULL     |
  |UID            | NULL     |
  |Event_ID       | NULL     |
  |Version_Number | NULL     |
  |Channel        | NULL     |
  |Start_Time     | NULL     |
  |Billed_Time    | NULL     |
  |Confidentiality   | NULL     |
  |Smoke_Screen_Flag | NULL     |
  |Core_Number       | NULL     |
When I copy "Schedule" file to FTP server into folder "location"
Given I log into Mediaflex
When I create a new workflow for Schedule transfer
And the data fails to import into Mediaflex - verify behaviour with TMD


Scenario: Import Schedule data with Special Characters as Values
  Given I have a valid "Schedule" data in Xml with the following:
    |Day_Type          | ****     |
    |On_Date           | +10         |
    |UID               | CBIC309Y/0 |
    |Event_ID          | ****     |
    |Version_Number    | ****           |
    |Channel           | ****       |
    |Start_Time        | 17:00:24   |
    |Billed_Time       | 17:00:00   |
    |Confidentiality   | +10        |
    |Video_Source      | ****         |
    |Smoke_Screen_Flag | ****     |
    |Core_Number       | ****      |
  Given I log into Mediaflex
  When I create a new workflow for Schedule transfer
  And the data fails to import into Mediaflex - verify behaviour with TMD


Scenario: Import Schedule data in Mediaflex with data populated - Invalid UID
  Given I have a valid "Schedule" data in Xml with the following:
    |Day_Type          | Standby     |
    |On_Date           | +10         |
    |UID               | ABCDEFG0012345689 |
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
  When I create a new workflow for Schedule transfer
  And the data fails to import into Mediaflex - verify behaviour with TMD


Scenario: Import Schedule data in Mediaflex with data populated - Video Source is TAPE
  Given I have a valid "Schedule" data in Xml with the following:
    |Day_Type          | Standby     |
    |On_Date           | +10         |
    |UID               | ABCDEFG0012345689 |
    |Event_ID          | 87989635     |
    |Version_Number    | 01           |
    |Channel           | bbc1       |
    |Start_Time        | 17:00:24   |
    |Billed_Time       | 17:00:00   |
    |Confidentiality   | +10        |
    |Video_Source      | TAPE         |
    |Smoke_Screen_Flag | hidden     |
    |Core_Number       | false      |
  When I copy "Schedule" file to FTP server into folder "location"
  Given I log into Mediaflex
  When I create a new workflow for Schedule transfer
  And the data fails to import into Mediaflex - verify behaviour with TMD