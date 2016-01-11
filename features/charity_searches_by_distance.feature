Feature: Charity searches by distance

Background:
  Given a profile for charity exists
    And a user is signed in
    And the charity is in the index page

@javascript
Scenario: A charity searches for contributions that are within 5km distance
  And some contributions exist
  And the charity chooses "5"
When the charity searches
Then a list with two contributions is shown

@javascript
Scenario: A charity searches for contributions that are within 10km distance
  And some contributions exist
  And the charity chooses "10"
When the charity searches
Then a list with three contributions is shown
