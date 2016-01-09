Feature: Provider creates a contribution and adds products and collection details
  Background:
    Given a profile for provider exist
      And a user is signed in
    When a provider adds contribution
    Then the page to add a contribution is shown
    When a provider fills the valid data


Scenario: Provider creates a contribution with one product
    And a provider creates contribution
  Then a contribution is created
    And the provider is taken to the show contribution page
    And the flash message "A contribution has been created" is shown

@javascript
Scenario: Provider creates a contribution with several products
    And a provider add a product
  Then a new entrance for a product is shown
    When the provider fills the data for the second product entry
      And a provider creates contribution
  Then a contribution with two products is created
    And the provider is taken to the show contribution page
    And the flash message "A contribution has been created" is shown
@wip
Scenario: Provider forgets to add collection date and time then contribution is not created
    And a provider does not add collection time and date
    And a provider creates contribution
  Then the contribution is not created
  And the error message "Contribution cannot be created without a collection date and time" is shown

Scenario: Provider adds collection date and time then contribution is created
    And a provider adds collection time and date
    And a provider creates contribution
  Then a contribution is created
    And the provider is taken to the show contribution page
  And the flash message "A contribution has been created" is shown
