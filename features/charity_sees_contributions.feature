Feature: Charity sees contributions

Scenario: A charity sees list of contributions
Given the charity is already registered
  And a user is signed in
  And some contributions exist
  And the charity is in the homepage
When the charity sees contributions
Then the charity is taken to the contribution index page
Then a list of contributions is shown
