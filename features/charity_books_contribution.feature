Feature: Charity books a contribution
@wip
Given the charity is in the index page
When charity books a contribution
Then the contribution is booked
  And a booking is created
