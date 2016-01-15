Feature: Charity sees contributions
@wip @javascript
Scenario: A charity sees list of providers
Given the charity is already registered
  And a user is signed in
  And some contributions exist
  And the charity is in the homepage
When the charity sees providers
Then the charity is taken to the contribution index page
  And a list of providers is shown
