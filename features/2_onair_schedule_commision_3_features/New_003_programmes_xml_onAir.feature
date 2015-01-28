Feature: Programmes data imported into Mediaflex

  Background:
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

  Scenario:  As an MST user, after Programmes data has been imported into Mediaflex, I should Verify ALL data populated
    Given I have a valid "Programmes" data in Xml with the following:
      | Core_Number             | CBIC311Y           |
      | UID                     | CBIC311Y/01        |
      | Version_Number          | 01                 |
      | Gross_Duration          | 1800               |
      | Content_Duration        | 1786.12            |
      | Video_Source            | FD                 |
      | HD                      | HD                 |
      | Programme_Title         | Doctor Who         |
      | Episode_Title           | Doctor Who         |
      | Published_Title         | The Darleks Attack |
      | Programme_ID            | 514289             |
      | Episode_ID              | 3198286            |
      | Confidentiality         | hidden             |
      | Repository_Confidential | false              |
    And I copy "Programmes" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\programmes"
#    Given I log into Mediaflex
#    When I search for UID "CBIC311Y/01"
#    Then I should see result "1" returned in Mediaflex
#    And I verify Version_Number as "01"
#    And I verify Gross_Duration as "1800"
#    And I verify Content_Duration as "1786.12"
#    And I verify HD as "HD"
#    And I verify Programme_Title as "Doctor Who"
#    And I verify Episode_Title as "Doctor Who"
#    And I verify Published_Title as "The Darleks Attack"
#    And I verify Programme_ID as "514289"
#    And I verify Episode_ID as "3198286"
#    And I verify Confidentiality as "hidden"
#    And I verify Repository_Confidential as "false"

  Scenario:  As an MST user, after Programmes data has been imported into Mediaflex, I should Verify mixed values are updated on existing Programmes data
    Given I send an update "Programmes" data in Xml with the following:
      | Core_Number             | CBIC311Y           |
      | UID                     | CBIC311Y/01        |
      | Version_Number          | 02                 |
      | Gross_Duration          | 1800               |
      | Content_Duration        | 1786.12            |
      | Video_Source            | FD                 |
      | HD                      | HD                 |
      | Programme_Title         | Doctor Who 2        |
      | Episode_Title           | Doctor Who 2       |
      | Published_Title         | The Darlecks Attack |
      | Programme_ID            | 514289             |
      | Episode_ID              | 3198286            |
      | Confidentiality         | hidden             |
      | Repository_Confidential | false              |
    And I copy "Programmes" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\programmes"
#    Given I log into Mediaflex
#    When I search for UID "CBIC311Y/01"
#    Then I should see result "1" returned in Mediaflex
#    And I verify Version_Number as "02"
#    And I verify Gross_Duration as "1800"
#    And I verify Content_Duration as "1786.12"
#    And I verify HD as "HD"
#    And I verify Programme_Title as "Doctor Who 2"
#    And I verify Episode_Title as "Doctor Who 2"
#    And I verify Published_Title as "The Darlecks Attack"
#    And I verify Programme_ID as "514289"
#    And I verify Episode_ID as "3198286"
#    And I verify Confidentiality as "hidden"
#    And I verify Repository_Confidential as "false"
