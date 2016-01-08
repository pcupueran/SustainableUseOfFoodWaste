Feature: Provider creates a contribution and adds products
@wip
Scenario: Provider creates a contribution
  Given a profile for provider exist
    And a user is signed in
  When a provider adds contribution
  Then the page to add a contribution is shown
  When a provider fills the valid data
    And a provider creates contribution
  Then a contribution is created
    And the flash message "A contribution has been created" is shown
