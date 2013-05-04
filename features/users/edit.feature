Feature: Edit user

  In order to ensure that user permissions and details stay current
  As an administrator
  I want to edit a user

  Background:
    Given I'm logged in as an administrator
    And another user exists

  Scenario: Valid data
    When I edit the user with valid data
    Then I should see a successful user updated message
    And I should be on the edit page for the user

  Scenario: Invalid e-mail
    When I edit the user with an invalid e-mail
    Then I should see an invalid e-mail message
    And I should be on the edit page for the user

  Scenario: No e-mail
    When I edit the user forgetting an e-mail
    Then I should see a e-mail required message
    And I should be on the edit page for the user

  Scenario: E-mail changed
    When I edit the user changing e-mail
    Then I should see a successful user updated message
    And I should be on the edit page for the user
    And a confirmation e-mail should have been sent to the user

  Scenario: Password can only be managed by the owner
    When I go to the edit page for the user
    Then I should not see a password field
    And I should not see a password confirmation field
