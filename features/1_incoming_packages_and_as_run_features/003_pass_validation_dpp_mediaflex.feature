Feature: Sending PACKAGE with PDF & MEDIA files into Mediaflex - Happy Paths

  Scenario Outline: As an MST, I want to verify files Pass DPP compliance checks
    Given a new valid UID <"Package"> which contains:
      | media_file | mxf |
      | doc_type   | pdf |
    And I use Media Shuttle to copy "package" to landing location into folder
    And I verify "md5" file is created
    And I verify Package exists in FBDi Store area
    Given I log into Mediaflex
    When I create a workflow to instruct "Baton" process
    Then I verify that the BATON has completed
    And I verify DPP compliant process passes with result "success"
    And I should receive an email with the subject
    """
      DPP completed successfully
      """
  Examples:
    | "Package"  |
    | "CBAX240F/01" |

  Scenario Outline: As an MST, I want to verify files DPP compliance has completed, and transcode created and imported
    Given a new valid UID <"Package"> which contains:
      | media_file | cabac |
      | doc_type   | pdf   |
    And I use Media Shuttle to copy "package" to landing location into folder
    And I verify "md5" file is created
    And I verify Package exists in FBDi Store area
    Given I log into Mediaflex
    When I create a workflow to instruct "Baton" process
    Then I verify that the BATON has completed
    When I create a workflow to instruct "Amberfin" process
    Then I verify that the AMBERFIN has completed
    And I verify "Transcode" process completed with result "success"
    And I should receive an email with the subject
    """
      DPP completed successfully
    """
  Examples:
    | "Package"  |
    | "CBAX241F/01" |


  Scenario Outline: As an MST, I want to verify files DPP compliance has completed, and I want to create files with low res proxy
    Given a new valid UID <"Package"> which contains:
      | media_file | mxf |
      | doc_type   | pdf |
    And I use Media Shuttle to copy "package" to landing location into folder
    And I verify "md5" file is created
    And I verify Package exists in FBDi Store area
    Given I log into Mediaflex
    When I create a workflow to instruct "Baton" process
    Then I verify that the BATON has completed
    When I create a workflow to instruct "Telestream" process
    Then I verify that the TELESTREAM has completed
    And I verify "Low Res" process completed with result "success"
    And I should receive an email with the subject
    """
      DPP completed successfully
    """
  Examples:
    | "Package"  |
    | "CBAX242F/01" |


