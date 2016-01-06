Given(/^a profile exist$/) do
  @email = Faker::Internet.email
  @charity = Charity.create!(email: @email, password: "password")
  @profile = Profile.create!(organization_name: "Food for everyone", user: @charity)
  @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", profile: @profile)
end

Given(/^a user is in the editing profile page$/) do
  visit edit_profile_path(@profile)
end

When(/^a user changes the address information$/) do
  fill_in "Street", :with => "Oxford Street"
end

When(/^a user updates his\/her profile$/) do
  click_button "Update profile"
end

Then(/^the profile's address is updated$/) do
  expect(Profile.first.address.street).to eq("Oxford Street")
end


