Feature: Provider creates a contribution and adds products
Scenario: Provider creates a contribution with one product
  Given a profile for provider exist
    And a user is signed in
  When a provider adds contribution
  Then the page to add a contribution is shown
  When a provider fills the valid data
    And a provider creates contribution
  Then a contribution is created
    And the provider is taken to the show contribution page
    And the flash message "A contribution has been created" is shown

@javascript
Scenario: Provider creates a contribution with several products
  Given a profile for provider exist
    And a user is signed in
  When a provider adds contribution
  Then the page to add a contribution is shown
  When a provider fills the valid data
    And a provider add a product
  Then a new entrance for a product is shown
    When the provider fills the data for the second product entry
      And a provider creates contribution
  Then a contribution with two products is created
    And the provider is taken to the show contribution page
    And the flash message "A contribution has been created" is shown
