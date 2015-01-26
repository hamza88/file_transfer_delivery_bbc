Feature: Project update XML, as AsRun Data, imported to Mediaflex

Background:
  Given I have a valid package which has passed DPP compliance and has been in transmission

 Scenario: Import AsRun data in Mediaflex with data populated - actual date
 Given I have a valid "AsRun" data in Xml with the following:
  | Event_ID          | 87989640    |
  | UID               | CBAX240F/01 |
  | Core_Number       | CBAX240F    |
  | Version_Number    | 01          |
  | Day_Type          | actual     |
  | Channel           | bbc1        |
  | Start_Time        | 17:00:24    |
  | Billed_Time       | 17:00:00    |
  | On_Date           | -3         |
  | Video_Source      | FD          |
  | Confidentiality   | public      |
  | Smoke_Screen_Flag | false       |
  And I copy "AsRun" file to folder "location"
  Given I log into Mediaflex
  When I search for UID "CBAX240F/01 "
  Then I should see result "1" returned in Mediaflex And I verify DAY_TYPE as "As-Run"

