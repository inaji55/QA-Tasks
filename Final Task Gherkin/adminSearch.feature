Feature: Search Functionality

Background:
    Given I open "OrangeHRM"
    And I sign in as an Admin with credentials "Admin / admin123"
    And I navigate to the admin page

# TC-13: Check Admin users search functionality
Scenario: Verify search results for Admin User Role
    When I scroll down to system users
    And I set User Role to "Admin"
    And I click search
    Then search results show users with Admin User Role
    And users with other roles are not included in the search results

# TC-14: Reset button functionality
Scenario: Verify search results reset
    When I scroll down to system users
    And I search for any user by Username, User Role, Employee Name, or Status
    And I click search
    And I click reset
    Then search results are reset

# TC-15 and TC-16: Search for admin with specific Username or Employee Name
Scenario Outline: Verify search results for a specific Username or Employee Name
    When I scroll down to system users
    And I set User Role to "Admin"
    And I enter a valid Admin <field_type> <field_value>
    And I click search
    Then search results show only the admin with the entered <field_type>

    Examples:
        | field_type     | field_value       |
        | Username       | "Admin"           |
        | Employee Name  | "Russel Hamilton" |

# TC-17: Search for admin with specific Status
Scenario: Verify search results for a specific Status
    When I scroll down to system users
    And I set User Role to "Admin"
    And I select status "enabled" from the status box
    And I click search
    Then search results show only users with Admin User Role and with the selected status

# TC-18: Search by part of Username
Scenario Outline: Verify search results for part of a Username
    When I scroll down to system users
    And I set User Role to "Admin"
    And I enter part of the username you searching for in the Username field <partial_username>
    And I click search
    Then search results show only Admins that their username contains the part you entered

    Examples:
    | partial_username |
    | "Adm"            |

# TC-19 and TC-20: Search for an invalid Employee Name or Username
Scenario Outline: Verify error message for an invalid Employee Name or Username
    When I scroll down to system users
    And I set User Role to "Admin"
    And I enter an invalid <field_type> <invalid_value>
    And I click search
    Then an error message is displayed for the invalid <field_type>

    Examples:
        | field_type     | invalid_value   |
        | Employee Name  | "Steve Jobs"    |
        | Username       | "wasd123"       |


# TC-21: Search with Empty form
Scenario: Verify all records are displayed for an empty form
    When I scroll down to system users
    And I click search
    Then all records are displayed
