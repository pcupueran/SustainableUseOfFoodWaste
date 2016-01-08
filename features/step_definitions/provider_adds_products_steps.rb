When(/^a provider adds contribution$/) do
  click_on "Add contribution"
end

Then(/^the page to add a contribution is shown$/) do
  expect(current_path).to eq(new_user_contribution_path(@user))
  expect(page).to have_content("Your contribution helps")
  expect(page).to have_content("Products")
end

When(/^a provider fills the valid data$/) do
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
  expect(page).to have_css("#product-2")
end

When(/^the provider fills the data for the second product entry$/) do
  within("#product-2") do
    fill_in "Quantity", :with => 5
    fill_in "Product name", :with => "Chicken sandwiches"
    check "Perishable"
  end
end

Then(/^a contribution with two products is created$/) do
  expect(Contribution.first.products.length).to eq(2)
  expect(Contribution.first.products.second.quantity).to eq(5)
  expect(Contribution.first.products.second.product_name).to eq("Chicken sandwiches")
  expect(Contribution.first.products.second.perishable).to eq(true)
  expect(Product.all.length).to eq(2)
end
