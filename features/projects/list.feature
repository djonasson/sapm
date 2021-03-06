Feature: List Projects

  In order to assign features to projects
  As an administrator
  I want to navigate available projects

  Background:
    Given I'm logged in as an administrator
    And a project called Guadeo exists
    And I'm on the projects list page

  Scenario: Project's details in list
    Then I should see the name of the project Guadeo

  Scenario: Project's show page
    When I click on the show button for project Guadeo
    Then I should be on the show page for project Guadeo
