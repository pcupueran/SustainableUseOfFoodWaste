Feature: Edit profile

Scenario: charity edits address in its profile
  Given a profile for charity exists
    And a user is signed in
    And a user is in the editing profile page
  When a user changes the address information
    And a user updates his/her profile
  Then the profile's address is updated

Scenario: provider edits address in its profile
  Given a profile for provider exists
    And a user is signed in
    And a user is in the editing profile page
  When a user changes the address information
    And a user updates his/her profile
  Then the profile's address is updated

Scenario: charity edits its profile
  Given a profile for charity exists
    And a user is signed in
    And charity is in the show profile page
    And charity edits its profile
  Then the edit profile page is shown

Scenario: provider edits its profile
  Given a profile for provider exists
    And a user is signed in
    And provider is in the show profile page
    And provider edits its profile
  Then the edit profile page is shown
