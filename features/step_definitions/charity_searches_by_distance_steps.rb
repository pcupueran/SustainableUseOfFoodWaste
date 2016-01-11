Given(/^the charity is in the index page$/) do
  visit contributions_path
end

Given(/^the charity chooses "(.*?)"$/) do |distance|
  select(distance, from: :distance)
end

When(/^the charity searches$/) do
  click_button "search"
end

Then(/^a list with two contributions is shown$/) do
  expect(page).not_to have_content(@contribution_1.user.organization_name)
  expect(page).to have_content(@contribution_2.user.organization_name)
  expect(page).to have_content(@contribution_3.user.organization_name)
end

Then(/^a list with three contributions is shown$/) do
  expect(page).to have_content(@contribution_1.user.organization_name)
  expect(page).to have_content(@contribution_2.user.organization_name)
  expect(page).to have_content(@contribution_3.user.organization_name)
end
