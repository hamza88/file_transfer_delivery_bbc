


Scenario:
  Given I have transferred a valid file and DPP compliance has completed
  And I have a valid "Schedule" data in Xml with the following:
    | Event_ID          | *87989635    |
    | UID               | CBIC309Y/01 |
    | Core_Number       | CBIC309Y    |
    | Version_Number    | 01          |
    | Day_Type          | Standby     |
    | Channel           | bbc1        |
    | Start_Time        | 17:00:24    |
    | Billed_Time       | 17:00:00    |
    | On_Date           | +10         |
    | Video_Source      | FD          |
    | Confidentiality   | *hidden      |
    | Smoke_Screen_Flag | false       |
  And I have a valid "Commissions" data in Xml with the following:
    | UID                     | CBIC309Y/01         |
    | Core_Number             | CBIC309Y            |
    | Version_Number          | 01                  |
    | Video_Source            | FD                  |
    | Delivery_Date           | +10                 |
    | Topicality              | non_topical         |
    | Supplier_Type           | In-House            |
    | Genre                   | Childrens NHU       |
    | In-House_Dept           | ANC–CURRENT AFFAIRS |
    | Confidentiality         | hidden              |
    | Repository_Confidential | false               |
  And I have a valid "Programmes" data in Xml with the following:
    | Core_Number             | CBIC309Y           |
    | UID                     | CBIC309Y/01        |
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
  And I copy "Schedule" & "Commissions" & "Programmes" file to folder "location"
  And I set the system time to "-10" days in order to trigger transfer
  When I create a workflow to trigger a transfer to Destination "Playout"
  Then I should receive a notification that the transfer has completed



