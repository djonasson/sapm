Feature: Edit user

  In order to ensure that user permissions and details stay current
  As an administrator
  I want to edit a user

  Background:
    Given I'm logged in as an administrator
    And a user called Daniel exists

  Scenario: Valid data
    When I edit Daniel with valid data
    Then I should see a successful user updated message
    And I should be on the edit page for Daniel

  Scenario: Invalid e-mail
    When I edit Daniel with an invalid e-mail
    Then I should see an invalid e-mail message

  Scenario: No e-mail
    When I edit Daniel forgetting an e-mail
    Then I should see an e-mail required message

  Scenario: E-mail changed
    When I edit Daniel changing e-mail
    Then I should see a successful user updated message
    And I should be on the edit page for Daniel
    And a confirmation e-mail should have been sent to Daniel

  Scenario: Password can only be managed by the owner
    When I go to the edit page for Daniel
    Then I should not see a password field
    And I should not see a password confirmation field
