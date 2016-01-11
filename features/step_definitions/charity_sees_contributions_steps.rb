Given(/^some contributions exist$/) do
  @email_1 = Faker::Internet.email
  @email_2 = Faker::Internet.email
  @email_3 = Faker::Internet.email

  @date = Faker::Date.forward(7)
  @time = Faker::Time.forward(7)
  @provider_1 = User.create!(organization_name: "Pret a manger", email: @email_1, password: "password", type: "Provider")
  @provider_2 = User.create!(organization_name: "Sainsbury's", email: @email_2, password: "password", type: "Provider")
  @provider_3 = User.create!(organization_name: "Tesco", email: @email_3, password: "password", type: "Provider")

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

  Geocoder::Lookup::Test.add_stub(
    "114 Campden Hill Road, W8 7AR, London, UK", [
      {
        'latitude'     => 51.5065242,
        'longitude'    => -0.1986481,
        'address'      => 'The Windsor Castle, 114 Campden Hill Rd, Kensington, London W8 7AR, UK',
        'city'         => 'London',
        'postal_code'  => 'W8 7AR',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    "127 Ledbury Road, W11 2AQ, London, UK", [
      {
        'latitude'     => 51.5166767,
        'longitude'    => -0.2001082,
        'address'      => '127 Ledbury Rd, London W11 2AQ, UK',
        'city'         => 'London',
        'postal_code'  => 'W11 2AQ',
        'country'      => 'United Kingdom',
        'country_code' => 'UK'
      }
    ]
  )
  @address_1 = Address.create!(door_number: "35", street: "Oxford Street", city: "London", country: "UK", postcode: "W1D 2DT", profile: @provider_1.profile)
  @address_2 = Address.create!(door_number: "114", street: "Campden Hill Road", city: "London", country: "UK", postcode: "W8 7AR", profile: @provider_2.profile)
  @address_3 = Address.create!(door_number: "127", street: "Ledbury Road", city: "London", country: "UK", postcode: "W11 2AQ", profile: @provider_3.profile)


  @contribution_1 = Contribution.create!(collection_date: @date, collection_time: @time, user: @provider_1, products_attributes: [
    {quantity: 3, product_name: "Tuna cans", perishable: "0"},
    {quantity: 5, product_name: "Chicken sandwiches", perishable: "1"}
  ])

  @contribution_2 = Contribution.create!(collection_date: @date,collection_time: @time, user: @provider_2, products_attributes: [
    {quantity: 3, product_name: "Tuna cans", perishable: "0"},
    {quantity: 5, product_name: "Fruit salads", perishable: "1"},
    {quantity: 5, product_name: "Chicken sandwiches", perishable: "1"}
  ])

  @contribution_3 = Contribution.create!(collection_date: @date,collection_time: @time, user: @provider_3, products_attributes: [
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
  expect(page).to have_content("Contribution donated by #{@provider_1.organization_name}")
  expect(page).to have_content("Contribution donated by #{@provider_2.organization_name}")
  expect(page).to have_content("Contribution donated by #{@provider_3.organization_name}")
end

