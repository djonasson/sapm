Feature: Edit Category

  In order ensure that project details stay correct
  As an authenticated user
  I want to edit a category

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And a category called Users exists for the project Guadeo
    And I'm on the edit project Guadeo page
    And I edit the category Users

  Scenario: Valid data
    When I edit the category with valid data
    Then I should see a successful category updated message
    And I should be on the edit page for project Guadeo

  Scenario: Missing name
    When I edit category Users forgetting to give a name
    Then I should see a category name required message
