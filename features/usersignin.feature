Feature: User
  As a user, i want to sign in.

  Scenario: Sign in into the website

  A user must be able to sign in.

    Given I am a user
    And there is a sign in page
    Then I provide username and password
    And I click on the sign in button
    Then I should be logged in and redirected to home page