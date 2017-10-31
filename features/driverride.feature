Feature: User
  As a user, i want to add a new ride as driver.

  Scenario: Adding ride

  A user must be able to add a ride.

    Given I am an existing user and I go to sign in page
    Then I provide username and password and sign in
    Then I go to add ride as a driver page
    And I enter origin
    And I enter destination
    And I enter departure details
    And I enter number of available seats
    And I select the gender of the passenger i would like to travel
    And I select what potential passenger should be ok with
    And I select whether I like to share gas price or not
    And I submit the the form
    Then I should be redirected to the new ride page
