Given(/^some contributions exist$/) do
  @email = Faker::Internet.email
  @date = Faker::Date.forward(7)
  @provider = User.create!(organization_name: "Pret a manger", email: @email, password: "password", type: "Provider")
  Contribution.create!(collection_date: @date, user: @provider, products_attributes: [
    {quantity: 3, product_name: "Tuna cans", perishable: "0"},
    {quantity: 5, product_name: "Chicken sandwiches", perishable: "1"}
  ])

  Contribution.create!(collection_date: @date, user: @provider, products_attributes: [
    {quantity: 3, product_name: "Tuna cans", perishable: "0"},
    {quantity: 5, product_name: "Fruit salads", perishable: "1"},
    {quantity: 5, product_name: "Chicken sandwiches", perishable: "1"}
  ])

  Contribution.create!(collection_date: @date, user: @provider, products_attributes: [
    {quantity: 3, product_name: "Tuna cans", perishable: "0"},
    {quantity: 4, product_name: "Chicken sandwiches", perishable: "1"},
    {quantity: 5, product_name: "Bananas", perishable: "1"},
    {quantity: 6, product_name: "Apples", perishable: "1"}
  ])
end

Given(/^the charity is in the homepage$/) do
  visit root_path
end

When(/^the charity sees contributions$/) do
  click_on "Contributions available"
end

Then(/^the charity is taken to the contribution index page$/) do
  expect(current_path).to eq(contributions_path)
end

Then(/^a list of contributions is shown$/) do
  expect(page).to have_content("Contribution donated by #{@provider.organization_name}")
end

