Feature: User
  As a user, i want to add a new ride as passenger.

  Scenario: Adding ride

  A user must be able to add a ride.

    Given I am a user and I go to sign in page
    Then I provide email and password and sign in
    Then I go to add ride as a passenger page
    And I enter origin details
    And I enter destination details
    And I enter departure date and time
    And I select the gender of the driver i would like to travel
    And I select what i'm be ok with
    And I select whether I would like to share gas price or not
    And I submit form
    Then I should be redirected to the new ride page and see my ride