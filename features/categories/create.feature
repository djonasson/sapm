Feature: Create Category

  In order to structure my projects
  As an authenticated user
  I want to create a new category

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And I'm on the edit project Guadeo page
    And I click New Category

  Scenario: Valid data
    When I enter valid data for a new category
    Then I should see a successful category creation message
    And I should be on the edit page for project Guadeo

  Scenario: Missing name
    When I forget to enter a name
    Then I should see a name required message
