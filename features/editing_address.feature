Feature: Edit address

Background:
  Given a profile exist
    And a user is in the editing profile page

Scenario: User edits address in his/her profile
  When a user changes the address information
    And a user updates his/her profile
  Then the user's address is updated
    And a flash message "You have updated your address" is shown
