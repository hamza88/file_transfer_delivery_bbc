Feature: Sending PACKAGE with PDF & MEDIA files into Mediaflex, wait for fail error

  Scenario Outline: As an MST, I receive notifications if Package fails DPP compliance.
    Given a new valid UID <"Package"> which contains:
      | media_file | mxf |
      | doc_type   | pdf |
    And I use Media Shuttle to copy "package" to landing location into folder
    And I verify "md5" file is created
    And I verify Package exists in FBDi Store area
    Given I log into Mediaflex
    When I create a workflow to instruct "DPP Compliant" process
    And I verify that the BATON has started
    And I verify that the BATON has completed
    And I verify DPP compliant process completed with result "failed"
    Then I should receive an email with the subject
    """
      DPP failed - Compliance failed
      """
  Examples:
    | "Package"  |
    | "Failed_DPP_Package" |








