Feature: Signing in

Background:
  Given the charity is in the sign in page
    And the charity is already registered

Scenario: A charity signs in
  When the charity fills the valid email and password
    And the charity signs in
  Then the charity is taken to the homepage
    And the flash message "Signed in successfully." is shown
