Feature: Create user

  In order to assign people to projects
  As an administrator
  I want to create a new user

  Background:
    Given I'm logged in as an administrator
    And I'm on the new user page

  Scenario: Valid data
    When I enter valid user data
    Then I should see a successful user creation message
    And I should be on the edit page for the newly created user
    And a confirmation e-mail should have been sent to the user

  Scenario: Invalid e-mail
    When I enter an invalid e-mail
    Then I should see an invalid e-mail message
    And I should be on the new user page

  Scenario: No e-mail
    When I forget to enter an e-mail
    Then I should see an e-mail required message
    And I should be on the new user page

  Scenario: No password
    When I forget to enter a password
    Then I should see a password required message
    And I should be on the new user page

  Scenario: No password confirmation
    When I forget to enter a password confirmation
    Then I should see a password confirmation required message
    And I should be on the new user page

  Scenario: Mismatched password and password confirmation
    When I enter a mismatched password confirmation
    Then I should see a mismatched password message
    And I should be on the new user page
