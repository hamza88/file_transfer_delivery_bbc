Feature: As an MST, I want to know when DPP content receipted and accepted by Playout

  Scenario Outline: Send ACCEPTED UID Packages to Playout
    Given a new valid UID <"Package"> which contains:
      | media_file | mxf |
      | doc_type   | pdf |
      | other_type | md5 |
    And I copy <"Package"> to "Mediaflex" location into folder "PATH\TO\FOLDER"
    Given I log into Mediaflex
    When I create a workflow to instruct "DPP Compliant" process
    And I verify that the BATON has completed
    And I verify that the TELESTREAM has completed
    And I verify DPP compliant process passes with result "success"
    And I create a workflow to instruct "TRANSFER" process
    And the package status has 'Playout'
    And there is a PACKAGE in POST-TX store
  Examples:
    | "Package"  |
    | "CBAX235F" |

  Scenario Outline: Package to be sent out to Playout if previous delivery failed
    Given I have previously sent package to playout # use same steps as above
    When a failed delivery exists
    Then workflow will be created to trigger attempt again
  Examples:
    | Package  | file_type |
    | CBAX235F | mxf       |

  Scenario Outline: Transfer of duplicate package to Playout
    Given a new valid UID <Package> which contains:
      | media_file | mxf |
      | doc_type   | pdf |
      | other_type | md5 |
    And I copy <Package> to "Mediaflex" location into folder "PATH\TO\FOLDER"
    Given I log into Mediaflex
    When I create a workflow to instruct "DPP Compliant" process
    And I verify that the BATON has completed commenced
    And I verify that the TELESTREAM has completed commenced
    And I verify DPP compliant process passes with result "success"
    And I create a workflow to instruct "TRANSFER" process
    And the package status has 'Playout'
    And there is a PACKAGE in POST-TX store
    When I import same Package again
    Then then it will not transfer package as existing package has been sent to Playout
  Examples:
    | Package  | file_type |
    | CBAX235F | mxf       |

  Scenario Outline: Transfer of Accepted package to Playout
    Given I have a valid Accepted Package # use same steps as above
    When I import same Package to Playout
    Then Accepted package should be imported to Playout
  Examples:
    | Package  | file_type |
    | CBAX235F | mxf       |

  Scenario Outline: Transfer of duplicate package to Playout from Post TX Store
    Given there is a valid Package in Post TX Store # use same steps as above
    When I import same Package to Playout
    Then  Package should be imported to Playout
  Examples:
    | Package  | file_type |
    | CBAX235F | mxf       |

