When(/^a provider adds contribution$/) do
  click_on "Add contribution"
end

Then(/^the page to add a contribution is shown$/) do
  expect(current_path).to eq(new_user_contribution_path(@user))
  expect(page).to have_content("Your contribution helps")
  expect(page).to have_content("Products")
end

When(/^a provider fills the valid data$/) do
  @i ||= 0
  fill_in "Quantity", :with => 3
  fill_in "Product name", :with => "Tuna cans"
end

When(/^a provider creates contribution$/) do
  click_button "Add contribution"
end

Then(/^a contribution is created$/) do
  expect(Contribution.all.length).to eq(1)
  expect(Contribution.first.products.first.quantity).to eq(3)
  expect(Contribution.first.products.first.product_name).to eq("Tuna cans")
  expect(Contribution.first.products.first.perishable).to eq(false)

end

Then(/^the provider is taken to the show contribution page$/) do
  expect(current_path).to eq(user_contribution_path(Contribution.first, user_id: @user.id))
end

When(/^a provider add a product$/) do
  click_on "Add product"
end

Then(/^a new entrance for a product is shown$/) do
  expect(page).to have_css(".product", count: 2)
end

When(/^the provider fills the data for the second product entry$/) do
  @i += 1
  fill_in "contribution_products_attributes_#{@i}_quantity", :with => 5
  fill_in "contribution_products_attributes_#{@i}_product_name", :with => "Chicken sandwiches"
  check "contribution_products_attributes_#{@i}_perishable"
end

Then(/^a contribution with two products is created$/) do
  expect(Contribution.first.products.length).to eq(2)
  expect(Contribution.first.products.second.quantity).to eq(5)
  expect(Contribution.first.products.second.product_name).to eq("Chicken sandwiches")
  expect(Contribution.first.products.second.perishable).to eq(true)
  expect(Product.all.length).to eq(2)
end

When(/^a provider does not add collection time and date$/) do
  select('Choose day', :from => "contribution[collection_date(3i)]")
  select('Choose month', :from => "contribution[collection_date(2i)]")
  select('Choose year', :from => "contribution[collection_date(1i)]")
end

Then(/^the contribution is not created$/) do
  expect(Contribution.all.length).to eq(0)
end

Then(/^the error message "(.*?)" is shown$/) do |error_message|
  expect(page).to have_content("Contribution cannot be created without a collection date and time")
end

When(/^a provider adds collection time and date$/) do
  select('10', :from => "contribution[collection_date(3i)]")
  select('January', :from => "contribution[collection_date(2i)]")
  select('2016', :from => "contribution[collection_date(1i)]")
end
