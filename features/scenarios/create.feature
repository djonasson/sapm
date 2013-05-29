Feature: Create Scenario

  In order to structure my projects
  As an authenticated user
  I want to create a new scenario

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And a category called Users exists for the project Guadeo
    And a feature called Create exists for the category Users
    And I'm on the show feature Create page
    And I click New Scenario

  Scenario: Valid data
    When I enter valid data for a new scenario
    Then I should see a successful scenario creation message
    And I should be on the show page for the feature Create

  Scenario: Missing name
    When I forget to enter a scenario name
    Then I should see a scenario name required message
