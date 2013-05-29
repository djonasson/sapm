Feature: Delete Feature

  In order ensure that project details stay correct
  As an authenticated user
  I want to delete a feature

  Background:
    Given I'm logged in as the user Daniel
    And a project called Guadeo exists
    And I'm assigned the project Guadeo
    And a category called Users exists for the project Guadeo
    And a feature called Create exists for the category Users
    And I'm on the show category Users page

  Scenario: Delete
    When I click on the delete button for the feature Create
    Then I should see a feature successfully deleted message
    And I should be on the show page for the category Users
