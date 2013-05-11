Feature: Create Project

  In order to assign features to projects
  As an administrator
  I want to create a new project

  Background:
    Given I'm logged in as an administrator
    And I'm on the new project page

  Scenario: Valid data
    When I enter valid data for a new project
    Then I should see a successful project creation message
    And I should be on the edit page for the project

  Scenario: Missing name
    When I forget to enter a name
    Then I should see a name required message
