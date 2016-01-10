Given(/^a profile for charity exists$/) do
  Geocoder::Lookup::Test.add_stub(
    "35 Lansdowne Road, W11 2LQ, London, UK", [
      {
        'latitude'     => 51.51055969999999,
        'longitude'    => -0.2077987,
        'address'      => '35 Lansdowne Rd, London W11, UK',
        'city'         => 'London',
        'postal_code'  => 'W11 2LQ',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )
  @email = Faker::Internet.email
  @user = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
  @address = Address.create!(door_number: "35", street: "Lansdowne Road", city: "London", country: "UK", postcode: "W11 2LQ", profile: @user.profile)
end
Given(/^a profile for provider exists$/) do

  Geocoder::Lookup::Test.add_stub(
    "35 Pelham Road, N22 6LN, London, UK", [
      {
        'latitude'     => 51.5951093,
        'longitude'    => -0.1067676,
        'address'      => '35 Pelham Rd, Wood Green, London N22 6LN, UK',
        'city'         => 'London',
        'postal_code'  => 'N22 6LN',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )
  @email = Faker::Internet.email
  @user = User.create!(organization_name: "Preta a manger", email: @email, password: "password", type: "Provider")
  @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N22 6LN", profile: @user.profile)
end

Given(/^a user is in the editing profile page$/) do
  visit edit_profile_path(@user.profile)
end

When(/^a user changes the address information$/) do
  fill_in "Street", :with => "Oxford Street"
  fill_in "Postcode", :with => "W1D 2DT"
end

When(/^a user updates his\/her profile$/) do
  Geocoder::Lookup::Test.add_stub(
    "35 Oxford Street, W1D 2DT, London, UK", [
      {
        'latitude'     => 51.51620759999999,
        'longitude'    => -0.1317682,
        'address'      => '35 Oxford St, Soho, London W1D 2DT, UK',
        'city'         => 'London',
        'postal_code'  => 'W1D 2DT',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )
  click_button "Update profile"
end

Then(/^the profile's address is updated$/) do
  expect(Profile.first.address.street).to eq("Oxford Street")
  expect(Profile.first.address.postcode).to eq("W1D 2DT")
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
