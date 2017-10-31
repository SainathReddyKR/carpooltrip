Feature: User
  As a user, i want to register into the website.

  Scenario: Register into the website

  A user must be able to register into the website.

    Given I am a non-existing user
    When I visit the website
    Then I click on the link to sign up
    And  I should enter my details in the form
    And  I submit the form
    Then I am successfully signed up