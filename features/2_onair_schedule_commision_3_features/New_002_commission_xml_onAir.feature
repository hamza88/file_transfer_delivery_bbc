Feature: Commission data imported into Mediaflex

  Background:
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
    And I copy "Commissions" file to folder "location"

  Scenario:  As an MST user, I should be able search for Commissions data in Mediaflex, Verify ALL data populated
#    Given I log into Mediaflex
#    When I search for UID "CBIC310Y/01"
#    Then I should see result "1" returned in Mediaflex
#    And I verify Version_Number as "01"
#    And I verify Video_Source as "FD"
#    And I verify Delivery_Date as "+90"
#    And I verify Topicality as "non_topical"
#    And I verify Supplier_Type as "In-House"
#    And I verify Genre as "Childrens NHU"
#    And I verify In-House_Dept as "ANC–CURRENT AFFAIRS"
#    And I verify Confidentiality as "hidden"
#    And I verify Repository_Confidential as "false"

  Scenario: As an MST user, having already imported Commissions data (background), I should see Commissions data updated in Mediaflex, where updated fields are versionNumber
    Given I send an update "Commissions" data in Xml with the following:
      | UID                     | CBIC310Y/02         |
      | Core_Number             | CBIC310Y            |
      | Version_Number          | 02                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +90                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | true                |
    And I copy "Commissions" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\commissions"
#    Given I log into Mediaflex
#    When I search for UID "CBIC310Y/02"
#    Then I should see result "1" returned in Mediaflex
#    And I verify Version_Number as "02"
#    And I verify Video_Source as "FD"
#    And I verify Delivery_Date as "+90"
#    And I verify Topicality as "non_topical"
#    And I verify Supplier_Type as "In-House"
#    And I verify Genre as "Childrens NHU"
#    And I verify In-House_Dept as "ANC–CURRENT AFFAIRS"
#    And I verify Confidentiality as "hidden"
#    And I verify Repository_Confidential as "true"


  Scenario: As an MST user, I should see Commissions data updated in Mediaflex, where updated fields are deliveryDate & Confidentiality
    Given I send an update "Commissions" data in Xml with the following:
      | UID                     | CBIC310Y/02         |
      | Core_Number             | CBIC310Y            |
      | Version_Number          | 02                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | +88                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | public              |
      | Repository_Confidential | true                |
    And I copy "Commissions" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\commissions"
    Given I log into Mediaflex
#    When I search for UID "CBIC310Y/02"
#    Then I should see result "1" returned in Mediaflex
#    And I verify Version_Number as "02"
#    And I verify Video_Source as "FD"
#    And I verify Delivery_Date as "+90"
#    And I verify Topicality as "non_topical"
#    And I verify Supplier_Type as "In-House"
#    And I verify Genre as "Childrens NHU"
#    And I verify In-House_Dept as "ANC–CURRENT AFFAIRS"
#    And I verify Confidentiality as "hidden"
#    And I verify Repository_Confidential as "true"

  Scenario: As an MST user, I should NOT see Schedule data updated in Mediaflex, as date is Past Contract Delivery date
    Given I have a valid "Commissions" data in Xml with the following:
      | UID                     | CBIC312Y/01         |
      | Core_Number             | CBIC312Y            |
      | Version_Number          | 01                  |
      | Video_Source            | FD                  |
      | Delivery_Date           | -10                 |
      | Topicality              | non_topical         |
      | Supplier_Type           | In-House            |
      | Genre                   | Childrens NHU       |
      | In-House_Dept           | ANC–CURRENT AFFAIRS |
      | Confidentiality         | hidden              |
      | Repository_Confidential | true                |
    And I copy "Schedule" file to folder "\\\\fgbw1e2efs002\\metadata\\ingest\\schedule"
#    Given I log into Mediaflex
#    When I search for UID "CBIC310Y/01"
#    Then I should see result "0" returned in Mediaflex

