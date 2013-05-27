Feature: Create Feature

  In order to structure my projects
  As an authenticated user
  I want to create a new feature

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And a category called Users exists for the project Guadeo
    And I'm on the show category Users page
    And I click New Feature

  Scenario: Valid data
    When I enter valid data for a new feature
    Then I should see a successful feature creation message
    And I should be on the show page for category Users

  Scenario: Missing name
    When I forget to enter a feature name
    Then I should see a feature name required message
