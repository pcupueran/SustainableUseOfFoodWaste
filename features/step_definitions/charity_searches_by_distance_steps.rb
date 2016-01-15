Given(/^the charity is in the index page$/) do
  visit users_path
end

Given(/^the charity chooses "(.*?)"$/) do |distance|
  select(distance, from: :distance)
end

When(/^the charity searches$/) do
  click_button "search"
end

Then(/^a list with two providers is shown$/) do
  expect(page).not_to have_content(@provider_1.organization_name)
  expect(page).to have_content(@provider_2.organization_name)
  expect(page).to have_content(@provider_3.organization_name)
end

Then(/^a list with three providers is shown$/) do
  expect(page).to have_content(@provider_1.organization_name)
  expect(page).to have_content(@provider_2.organization_name)
  expect(page).to have_content(@provider_3.organization_name)
end
