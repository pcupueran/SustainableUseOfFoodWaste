Feature: Edit address

Scenario: charity edits address in its profile
  Given a profile for charity exist
    And a user is in the editing profile page
  When a user changes the address information
    And a user updates his/her profile
  Then the profile's address is updated

Scenario: provider edits address in its profile
  Given a profile for provider exist
    And a user is in the editing profile page
  When a user changes the address information
    And a user updates his/her profile
  Then the profile's address is updated
