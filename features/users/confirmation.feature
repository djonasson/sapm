Feature: Confirmation

  In order to get access to protected sections of the site
  As a visitor that has been assigned an account
  I should be able to confirm my e-mail address

  Background:
    Given I exist as a user
    And My account has not been confirmed
    And I'm on the activate account page

  Scenario: Successfully confirms account
    When I choose a valid password
    Then I should see an account confirmed message
    And I should be signed in

  Scenario: No password
    When I give no password
    Then I see a password can't be blank message
    And I should be signed out

  Scenario: No password confirmation
    When I give no password confirmation
    Then I see a passwords don't match message
    And I should be signed out

  Scenario: Password mismatch
    When I give non-matching password and password confirmation
    Then I see a passwords don't match message
    And I should be signed out
