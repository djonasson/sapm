Feature: List Users

  In order to assign users to projects
  As an administrator
  I want to navigate available users

  Background:
    Given I'm logged in as an administrator
    And a user called Daniel exists
    And I'm on the users list page

  Scenario: User's details in list
    Then I should see the name of the user Daniel
    And I should see the e-mail of the user Daniel
