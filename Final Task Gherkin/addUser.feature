Feature: Add New User

Background:
    Given Admin is logged in with valid credentials
        | username | password  |
        | Admin    | admin123 |
    And Admin navigates to Admin page

Scenario: Admin adds a user with valid data
    When Admin navigates to the "Add User" form
    And Admin fills in valid data for all fields
        | User Role | Employee Name | Status  | Username | Password | Confirm Password |
        | ESS       | Ibrahim Naji  | Enabled | INaji55  | i1234567 | i1234567         |
    And Admin submits the form
    Then a success message is displayed
    And the user is added to the system with the entered details

Scenario: Admin cancels adding a user without making changes
    When Admin navigates to the "Add User" form
    And Admin clicks the "Cancel" button
    Then the form is closed without any changes being applied

Scenario: Verify correct error messages for each required field
    When Admin navigates to the "Add User" form
    And Admin submits the form with all fields empty
    Then suitable error messages are displayed for each required field

Scenario: Admin adds a user with valid data and some empty fields
    When Admin navigates to the "Add User" form
    And Admin fills in valid data for some fields
        | User Role | Employee Name | Status  | Username | Password | Confirm Password |
        | ESS       | Ibrahim Naji  | Enabled |          |          | i1234567         |
    And Admin submits the form
    Then a success message is displayed
    And the user is added to the system with the entered details

Scenario Outline: Verify error messages for invalid username length
    When Admin navigates to the "Add User" form
    And Admin enters a username <username>
    And Admin submits the form
    Then an error message is displayed indicating that the <error_message>

    Examples:
    | username                                           | error_message                            |
    | "naji"                                             | "Username must be 5 characters or more"  |
    | "qazwsxedcrfvtgbyhnujmikolpqazwsxedcrfvtgbyhn1234" | "Username must be 40 characters or less" |

Scenario Outline: Verify error messages for invalid password
    When Admin navigates to the "Add User" form
    And Admin enters an invalid password <password>
    And Admin submits the form
    Then an error message is displayed indicating that the <error_message>

    Examples:
    | password                                                             | error_message                                            |
    | "12345678"                                                           | "Password should contain at least 1 lower-case letter"   |
    | "i12345"                                                             | "Password should have at least 7 characters"             |
    | "i12345678900987654321123456789009876543211234567890098765432112345" | "Password should not exceed 64 characters"               |

Scenario: Verify error message for password mismatch
    When Admin navigates to the "Add User" form
    And Admin enters a valid password "i123456"
    And Admin enters a different password in the confirm password field "i654321"
    And Admin submits the form
    Then an error message is displayed indicating that the "Passwords do not match"

Scenario: Verify error message for existing username
    When Admin navigates to the "Add User" form
    And Admin enters an already used username
    And Admin submits the form
    Then an error message is displayed indicating that the "Username already exists"

Scenario: Verify error message for invalid Employee Name
    When Admin navigates to the "Add User" form
    And Admin enters valid data with a non-existent Employee Name "Steve Jobs"
        | User Role | Employee Name | Status  | Username   | Password | Confirm Password |
        | ESS       | Ibrahim Naji  | Enabled | Steve Jobs | i1234567 | i1234567         |
    And Admin submits the form
    Then an error message is displayed for the invalid Employee Name

Scenario Outline: Verify options in a field
    When Admin navigates to the "Add User" form
    And Admin clicks on the <field_name> SelectBox
    Then a list is displayed showing the options <options>

    Examples:
    | field_name | options                    |
    | User Role  | "Admin" and "ESS"          |
    | Status     | "enabled" and "disabled"   |
