When(/^a provider adds contribution$/) do
  click_on "Add contribution"
end

Then(/^the page to add a contribution is shown$/) do
  expect(current_path).to eq(new_user_contribution_path(@user))
  expect(page).to have_content("Your contribution helps")
  expect(page).to have_content("Products")
end

When(/^a provider fills the valid data$/) do
  # click_button "Add a product"
  within("#product1") do
    fill_in "Quantity", :with => 3
    fill_in "Product name", :with => "Tuna cans"
  end

  # within("#product2") do
  #   fill_in "Quantity", :with => 5
  #   fill_in "Product name", :with => "Chicken sandwiches"
  #   check "Perishable"
  # end
  # click_button "Add a product"
end

When(/^a provider creates contribution$/) do
  click_button "Add contribution"
end

Then(/^a contribution is created$/) do
  expect(Contribution.all.length).to eq(1)
  expect(Contribution.first.products.first.quantity).to eq(3)
  expect(Contribution.first.products.first.product_name).to eq("Tuna cans")
  expect(Contribution.first.products.first.perishable).to eq(false)

  expect(Contribution.first.products.second.quantity).to eq(5)
  expect(Contribution.first.products.second.product_name).to eq("Chicken sandwiches")
  expect(Contribution.first.products.second.perishable).to eq(true)
  expect(Product.all.length).to eq(2)
end

