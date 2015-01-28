Feature: Schedule data imported into Mediaflex

  Scenario:  As an MST user, after Schedule data import into Mediaflex I should be able to verify if ALL data populated
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | CBIC309Y/01         |
      | Core_Number             | CBIC309Y            |
      | Version_Number          | 01                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +90                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | false               |
    And I copy "Commissions" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\commissions"
    Given I have a valid "Schedule" data in Xml with the following:
      | Event_ID          | 87989635    |
      | UID               | CBIC309Y/01 |
      | Core_Number       | CBIC309Y    |
      | Version_Number    | 01          |
      | Day_Type          | Standby     |
      | Channel           | bbc1        |
      | Start_Time        | 17:00:24    |
      | Billed_Time       | 17:00:00    |
      | On_Date           | +10         |
      | Video_Source      | FD          |
      | Confidentiality   | hidden      |
      | Smoke_Screen_Flag | false       |
    And I copy "Schedule" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\schedule"
#    Given I log into Mediaflex
#    When I search for UID "CBIC309Y/01"
#    Then I should see result "1" returned in Mediaflex
#    And I verify DAY_TYPE as "Standby"
#    And I verify On_Date as "+10"
#    And I verify Video_Source as "FD"
#    And I verify UID as "CBIC309Y/01"
#    And I verify Event_ID as "87989635"
#    And I verify Version_Number as "01"
#    And I verify Channel as "bbc1"
#    And I verify Start_Time as "17:00:24"
#    And I verify Billed_Time as "17:00:00"
#    And I verify Confidentiality as "+10"
#    And I verify Video_Source as "FD"
#    And I verify Smoke_Screen_Flag as "hidden"
#    And I verify Core_Number as "false"

#  Scenario: As an MST user, I search for an Invalid UID in Mediaflex, and verify contents not found
#    Given I log into Mediaflex
#    When I search for UID "CBICasdasdY/0"
#    Then I should see result "0" returned in Mediaflex

  Scenario: As an MST user, after Schedule data import into Mediaflex I should be able to verify fields updated (DayType, Channel, OnDate, Confidentiality)
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | CBIC310Y/01         |
      | Core_Number             | CBIC310Y            |
      | Version_Number          | 01                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +90                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | false               |
    And I copy "Commissions" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\commissions"
    Given I have a valid "Schedule" data in Xml with the following:
      | Event_ID          | 87989635    |
      #eventid identifier. Same eventid but different UID where updates occur
      | UID               | CBIC310Y/01 |
      | Core_Number       | CBIC3010Y    |
      | Version_Number    | 01          |
      | Day_Type          | Standby     |
      | Channel           | bbc1        |
      | Start_Time        | 17:00:24    |
      | Billed_Time       | 17:00:00    |
      | On_Date           | +10         |
      | Video_Source      | FD          |
      | Confidentiality   | public      |
      | Smoke_Screen_Flag | false       |
    And I copy "Schedule" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\schedule"
    Given I send an update "Schedule" data in Xml with the following:
      | Event_ID          | 87989635    |
      | UID               | CBIC310Y/01 |
      | Core_Number       | CBIC310Y    |
      | Version_Number    | 02          |
      | Day_Type          | Planned     |
      | Channel           | bbc2        |
      | Start_Time        | 17:40:24    |
      | Billed_Time       | 17:40:00    |
      | On_Date           | +9         |
      | Video_Source      | FD          |
      | Confidentiality   | hidden      |
      | Smoke_Screen_Flag | false       |
    And I copy "Schedule" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\schedule"
#    Given I log into Mediaflex
#    When I search for UID "CBIC310Y/01"
#    Then I should see result "1" returned in Mediaflex
#    And I verify Day_Type as "Planned"
#    And I verify Channel as "bbc2"
#    And I verify On_Date as "+9"
#    And I verify Event_ID as "87989636"
#    And I verify Version_Number as "02"
#    And I verify Channel as "bbc2"
#    And I verify Start_Time as "17:40:24"
#    And I verify Billed_Time as "17:40:00"
#    And I verify Confidentiality as "+9"
#    And I verify Smoke_Screen_Flag as "hidden"

Scenario: As an MST user, after Schedule data import into Mediaflex I should be able to view data populated - and check to see if the update on UID has taken place.
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | CBIC311Y/01         |
      | Core_Number             | CBIC311Y            |
      | Version_Number          | 01                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +90                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | false               |
   And I copy "Commissions" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\commissions"
    Given I have a valid "Schedule" data in Xml with the following:
      | Event_ID          | 87989635    |
      #eventid identifier. Same eventid but different UID where updates occur
      | UID               | CBIC311Y/01 |
      | Core_Number       | CBIC311Y    |
      | Version_Number    | 01          |
      | Day_Type          | Standby     |
      | Channel           | bbc1        |
      | Start_Time        | 17:00:24    |
      | Billed_Time       | 17:00:00    |
      | On_Date           | +10         |
      | Video_Source      | FD          |
      | Confidentiality   | public      |
      | Smoke_Screen_Flag | false       |
   And I copy "Schedule" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\schedule"
    Given I send an update "Schedule" data in Xml with the following:
      | Event_ID          | 87989635    |
      | UID               | CBIC312Y/02 |
      | Core_Number       | CBIC312Y    |
      | Version_Number    | 02          |
      | Day_Type          | Planned     |
      | Channel           | bbc2        |
      | Start_Time        | 17:00:24    |
      | Billed_Time       | 17:00:00    |
      | On_Date           | +10         |
      | Video_Source      | FD          |
      | Confidentiality   | hidden      |
      | Smoke_Screen_Flag | false       |
   And I copy "Schedule" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\schedule"
#    Given I log into Mediaflex
#    When I search for UID "CBIC311Y/01"
#    Then I should see result "0" returned in Mediaflex
#    When I search for UID "CBIC312Y/02"
#    Then I should see result "1" returned in Mediaflex
#
