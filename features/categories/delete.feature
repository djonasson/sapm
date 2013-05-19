Feature: Delete Category

  In order ensure that project details stay correct
  As an authenticated user
  I want to delete a category

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And a category called Users exists for the project Guadeo
    And I'm on the edit project Guadeo page

  Scenario: Delete
    When I click on the delete button for the category Users
    Then I should see a category successfully deleted message
    And I should be on the edit page for project Guadeo
