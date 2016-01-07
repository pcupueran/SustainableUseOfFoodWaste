Given(/^the charity is in the sign in page$/) do
  visit new_user_session_path
end

Given(/^the charity is already registered$/) do
  @email = Faker::Internet.email
  Charity.create!(organization_name: "Food for everyone", :email => @email, :password => "password")
end

When(/^the charity fills the valid email and password$/) do
  fill_in 'Email', :with => @email
  fill_in 'Password', :with => "password"
end

When(/^the charity signs in$/) do
  click_button 'Log in'
end

Then(/^the charity is taken to the homepage$/) do
  expect(current_path).to eq(root_path)
end

Then(/^the charity sees a notice "(.*?)"$/) do |message|
  expect(page.has_content?(message)).to be true
end

