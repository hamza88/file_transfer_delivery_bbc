Feature: NFA Verifications

  Scenario Outline: As Production user, I send a Package to Signiant landing area, and verify MD5 is created and package has reached FBDi landing area
    Given a new valid UID <"Package"> which contains:
      | media_file | mxf |
      | doc_type   | pdf |
    And I use Media Shuttle to copy "package" to landing location into folder
    And I verify "md5" file is created
    And I verify Package exists in FBDi Store area
  Examples:
    | "Package"  |
    | "CBAX236F/01" |

  Scenario Outline: As Production user, I send a Duplicate Package to Signiant landing area, and verify duplicates are rejected
    Given a new valid UID <"Package"> which contains:
      | media_file | mxf |
      | doc_type   | pdf |
    And I use Media Shuttle to copy "package" to landing location into folder
    When I repeat the steps again, for same <"Package">
    Then the NFA adaptor will reject package and I should receive an email with the subject
    """
      Invalid UID
    """
  Examples:
    | "Package"  |
    | "CBAX237F/01" |

  Scenario Outline: As Production user, I send individual PDF file but NFA adaptor rejects it
    Given a new valid UID <"Package"> which contains:
      | doc_type   | pdf |
    And I use Media Shuttle to copy "package" to landing location into folder
    Then the NFA adaptor will reject package and I should receive an email with the subject
     """
      Invalid Package
    """
  Examples:
  | "Package"  |
  | "CBAX238F/01" |


  Scenario Outline: As Production user, I send AVI file but NFA adaptor rejects it
    Given a new valid UID <"Package"> which contains:
      | avi_file | avi |
    And I use Media Shuttle to copy "package" to landing location into folder
#    Then the NFA adaptor will reject package todo: Check Mediaflex for rejections
    Then the NFA adaptor will reject package and I should receive an email with the subject
    """
      Invalid File format
    """
  Examples:
    | "Package"  |
    | "CBAX239F/01" |

#  @invalid_test
#  Scenario: As Production user, I send individual files and verify files are packaged in each Package and sent to Media Landing area
#    Given I have an individual "mxf" file
#    And I copy to "Signiant" landing area into folder
#    And I verify "md5" file is created
#    And I verify Package exists in "Mediaflex" Landing area

  Scenario Outline: As an Production, I want to verify that invalid UID's are deleted and notifications are sent out.
    Given a new valid UID <"Package"> which contains:
      | non_dpp_media_file | mxf |
      | non_dpp_doc_type   | pdf |
    And I use Media Shuttle to copy "package" to landing location into folder
    Then the NFA adaptor will reject package and I should receive an email with the subject
    """
      DPP failed - Invalid UID
      """
  Examples:
    | "Package"     |
    | "INVALID_UID" |



