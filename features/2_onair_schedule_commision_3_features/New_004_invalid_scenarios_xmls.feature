Feature: Ensure values for both Commissions and Schedule files, are validated before import to Mediaflex
# very rarely are programmes xml empty. Do not test!

  Scenario: Null Values  on Commissions data
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | CBIC340Y/01         |
      | Core_Number             | CBIC340Y            |
      | Version_Number          | NULL                |
      | Video_Source            | NULL                |
      | Delivery_Date           | NULL                |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | false               |
    And I copy "Commissions" file to folder "location"
    Given I log into Mediaflex
    When I search for UID "CBIC320Y/01"
    Then I should see result "0" returned in Mediaflex

  Scenario: Invalid UID on Commissions data
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | XXXX1Y/01           |
      | Core_Number             | XXXX1Y              |
      | Version_Number          | 01                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +90                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | false               |
    And I copy "Commissions" file to folder "location"
    Given I log into Mediaflex
    When I search for UID "XXXX1Y/01"
    Then I should see result "0" returned in Mediaflex


  Feature: Null values on Schedule data
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | CBIC341Y/01         |
      | Core_Number             | CBIC341Y            |
      | Version_Number          | 01                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +90                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | false               |
    And I copy "Commissions" file to folder "location"
    Given I have a valid "Schedule" data in Xml with the following:
      | Event_ID          | 87989635 |
      | UID               | NULL     |
      | Core_Number       | NULL     |
      | Version_Number    | NULL     |
      | Day_Type          | NULL     |
      | Channel           | bbc1     |
      | Start_Time        | 17:00:24 |
      | Billed_Time       | 17:00:00 |
      | On_Date           | +10      |
      | Video_Source      | NULL     |
      | Confidentiality   | hidden   |
      | Smoke_Screen_Flag | false    |
    And I copy "Commissions" file to folder "location"
    Given I log into Mediaflex
    When I search for UID "CBIC3241Y/01"
    Then I should see result "0" returned in Mediaflex


  Feature: Invalid/missing values on Schedule data
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | CBIC342Y/01         |
      | Core_Number             | CBIC342Y            |
      | Version_Number          | 01                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +90                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | false               |
    And I copy "Commissions" file to folder "location"
    Given I have a valid "Schedule" data in Xml with the following:
      | Event_ID          | 87989635    |
      | UID               | CBIC342Y/01 |
      | Core_Number       | CBIC342Y    |
      | Version_Number    | 01          |
      | Day_Type          | XXX     |
      | Channel           | bbc1123        |
      | Start_Time        | 17:00:24    |
      | Billed_Time       | 17:00:00    |
      | On_Date           | +190         |
      | Video_Source      | FD          |
      | Confidentiality   | hidden      |
      | Smoke_Screen_Flag | false       |
    And I copy "Commissions" file to folder "location"
    Given I log into Mediaflex
    When I search for UID "CBIC342Y/01"
    Then I should see result "0" returned in Mediaflex
