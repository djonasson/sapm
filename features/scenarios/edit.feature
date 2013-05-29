Feature: Edit Scenario

  In order ensure that project details stay correct
  As an authenticated user
  I want to edit a scenario

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And a category called Users exists for the project Guadeo
    And a feature called Create exists for the category Users
    And a scenario called Valid Data exists for the feature Create
    And I'm on the edit scenario Valid Data page

  Scenario: Valid data
    When I edit the scenario with valid data
    Then I should see a successful scenario updated message
    And I should be on the show page for the feature Create

  Scenario: Missing name
    When I edit scenario Valid forgetting to give a name
    Then I should see a scenario name required message
