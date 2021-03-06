Given(/^the charity is in the sign in page$/) do
  visit new_user_session_path
end

Given(/^the charity is already registered$/) do
  @email = Faker::Internet.email
  @user = User.create!(organization_name: "Food for everyone", :email => @email, :password => "password", type: "Charity")
end

When(/^the charity fills the valid email and password$/) do
  fill_in 'Email', :with => @email
  fill_in 'Password', :with => "password"
end

When(/^the charity signs in$/) do
  click_button 'Log in'
end

Then(/^the charity is taken to the homepage$/) do
  expect(current_path).to eq(profile_path(@user))
end

Then(/^the flash message "(.*?)" is shown$/) do |message|
  expect(page).to have_content(message)
end
