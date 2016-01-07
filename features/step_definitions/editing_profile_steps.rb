Given(/^a profile for charity exist$/) do
  @email = Faker::Internet.email
  @user = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
  @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", profile: @user.profile)
end
Given(/^a profile for provider exist$/) do
  @email = Faker::Internet.email
  @user = User.create!(organization_name: "Preta a manger", email: @email, password: "password", type: "Provider")
  @address = Address.create!(door_number: "3", street: "Tottenham High Road", city: "London", country: "UK", postcode: "SW16 4RN", profile: @user.profile)
end

Given(/^a user is in the editing profile page$/) do
  visit edit_profile_path(@user.profile)
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

Given(/^provider is in the show profile page$/) do
  visit profile_path(@user.profile)
end

Given(/^provider edits its profile$/) do
  click_on "Edit profile"
end

Then(/^the edit profile page is shown$/) do
  expect(current_path).to eq(edit_profile_path(@user.profile))
  expect(page).to have_content("Edit profile")
end

Given(/^charity is in the show profile page$/) do
  visit profile_path(@user.profile)
end

Given(/^charity edits its profile$/) do
  click_on "Edit profile"
end

Given(/^a user is signed in$/) do
  visit new_user_session_path
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => @user.password
  click_button "Log in"
end
