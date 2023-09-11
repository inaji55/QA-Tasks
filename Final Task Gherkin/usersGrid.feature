Feature: Users Grid Display and Functionality

Background:
    Given I open "OrangeHRM"
    And I sign in as an Admin with credentials "Admin / admin123"
    And I navigate to the admin page
    And I scroll down to the Users Grid

# TC-22: Verify Grid Display
Scenario: Verify the display of all columns and rows
    Then the grid should display all columns and rows correctly without any visual discrepancies

# TC-23 to TC-30: Verify Sorting Functionality
Scenario Outline: Verify sorting functionality for <column>
    When I press the sort icon next to the <column> column
    And I select <order>
    Then the records in the users grid are in <order> order by <column>

    Examples:
    | column          | order      |
    | Username        | Ascending  |
    | Username        | Descending |
    | User Role       | Ascending  |
    | User Role       | Descending |
    | Employee Name   | Ascending  |
    | Employee Name   | Descending |
    | Status          | Ascending  |
    | Status          | Descending |

# TC-31: The Grid Is Responsive
Scenario: Verify grid responsiveness
    When I click the Restore Down button
    And I change the browser's size
    Then the grid layout should display correctly with evenly distributed columns on all sizes

# TC-32: Select All CheckBox
Scenario: Verify "Select All" checkbox functionality
    When I press the checkbox next to the Username column
    Then all the Users are selected

# TC-33: Number of records found
Scenario: Verify display of the number of records found
    Then a message is displayed indicating the number of records found
    And the message provides an accurate count of the total number of records

# TC-34: Delete multiple users
Scenario: Verify deletion of multiple records
    When I select multiple records
    And I press the "Delete Selected" button
    And I confirm the deletion
    Then the records are deleted, and they are no longer on the grid

# TC-35: Actions – "Delete" Button
Scenario: Verify deletion of a record using the "Delete" button
    When I press the Delete button for a record
    And I confirm the deletion
    Then the record is deleted, and it's no longer on the grid

# TC-36: Actions – "Edit" Button
Scenario: Verify editing of a record using the "Edit" button
    When I press the Edit button for a record
    And I edit any field data
    And I submit the edit form
    Then the record is edited, and it's displayed with the new data on the grid
