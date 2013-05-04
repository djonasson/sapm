Feature: Sign in

  In order to get access to protected sections of the site
  As a visitor that has previously been assigned an account
  I should be able to sign in

  Scenario: Signs in successfully
    Given I exist as a user
    And My account has been confirmed
    And I am not logged in
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in

  Scenario: Doesn't exist
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I see an invalid login message
    And I should be signed out

  Scenario: Tries to sign in before confirming the e-mail
    Given I exist as a user
    And My account has not been confirmed
    When I sign in with valid credentials
    Then I should see an unconfirmed account message
    And I should be signed out

  Scenario: No e-mail
    Given I exist as a user
    And My account has been confirmed
    And I am not logged in
    When I sign in with no e-mail
    Then I see a missing e-mail message
    And I should be signed out

  Scenario: No password
    Given I exist as a user
    And My account has been confirmed
    And I am not logged in
    When I sign in with no password
    Then I see a missing password message
    And I should be signed out

  Scenario: Wrong password
    Given I exist as a user
    And My account has been confirmed
    And I am not logged in
    When I sign in with a wrong password
    Then I see an invalid login message
    And I should be signed out
