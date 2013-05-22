Feature: Add Project to User

  In order to let users work on projects
  As an administrator
  I want to associate a user with a project

  Background:
    Given I'm logged in as an administrator
    And a user called Daniel exists
    And a project called Guadeo exists
    And I'm on the edit page for the user Daniel

  Scenario: Valid data
    When I associate the project Guadeo with the user Daniel
    Then I should see a successful user updated message
    And I should be on the edit page for Daniel
    And the user Daniel should be associated with the project Guadeo
