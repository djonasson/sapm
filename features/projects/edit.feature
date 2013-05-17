Feature: Edit Project

  In order to ensure that project details stay current
  As an administrator
  I want to edit a project

  Background:
    Given I'm logged in as an administrator
    And a project called Guadeo exists

  Scenario: Valid data
    When I edit project Guadeo with valid data
    Then I should see a successful project updated message
    And I should be on the admin edit page for project Guadeo

  Scenario: Missing name
    When I edit project Guadeo forgetting to give a name
    Then I should see a name required message
