Feature: User Profile

  In order to keep my personal information updated
  As an authenticated user
  I want to manage my profile

  Background:
    Given I'm logged in as the user Daniel
    And I'm on the profile page

  Scenario: Personal details visible
    Then I should see the name of the user Daniel
    And I should see the e-mail of the user Daniel
