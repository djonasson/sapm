Feature: Edit Feature

  In order ensure that project details stay correct
  As an authenticated user
  I want to edit a feature

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And a category called Users exists for the project Guadeo
    And a feature called Create exists for the category Users
    And I'm on the edit feature Create page

  Scenario: Valid data
    When I edit the feature with valid data
    Then I should see a successful feature updated message
    And I should be on the show page for the category Users

  Scenario: Missing name
    When I edit feature Create forgetting to give a name
    Then I should see a feature name required message
