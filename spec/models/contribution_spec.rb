require 'rails_helper'

RSpec.describe Contribution, type: :model do
  describe "Contribution" do
    before do
      @email_1 = Faker::Internet.email
      @email_2 = Faker::Internet.email
      @date = Faker::Date.forward(7)
      @time = Faker::Time.forward(7)

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
      address_params = {
        door_number: "35",
        street: "Oxford Street",
        city: "London",
        country: "UK",
        postcode: "W1D 2DT"
      }
      @provider_1 = User.create!(organization_name: "Waitrose", email: @email_1, password: "password", type: "Provider")
      @provider_2 = User.create!(organization_name: "Pret a manger", email: @email_2, password: "password", type: "Provider")

      @provider_1.profile.address.update!(address_params)
      @provider_2.profile.address.update!(address_params)

      @contribution_1 = Contribution.create!(collection_date: @date, collection_time: @time, user: @provider_1, products_attributes: [
        {quantity: 3, product_name: "Tuna cans", perishable: "0"},
        {quantity: 5, product_name: "Chicken sandwiches", perishable: "1"}
      ])
      @contribution_2 = Contribution.create!(collection_date: @date, collection_time: @time, user: @provider_2, products_attributes: [
        {quantity: 3, product_name: "Tuna cans", perishable: "0"},
        {quantity: 5, product_name: "Chicken sandwiches", perishable: "1"}
      ])
    end

    it "belongs to a provider" do
      expect(Contribution.first.user.type).to eq("Provider")
      expect(Contribution.first.user.organization_name).to eq("Waitrose")
    end

    it "gives providers information as json" do
      expect(Contribution.providers_as_json([@provider_1, @provider_2])).to eq([{
        "organizationName" => @provider_1.organization_name,
        "email" => @provider_1.email,
        "address" => @provider_1.profile.address.geocode_string,
        "latitude" => @provider_1.profile.address.latitude,
        "longitude" => @provider_1.profile.address.longitude
      },{
        "organizationName" => @provider_2.organization_name,
        "email" => @provider_2.email,
        "address" => @provider_2.profile.address.geocode_string,
        "latitude" => @provider_2.profile.address.latitude,
        "longitude" => @provider_2.profile.address.longitude
      }])
    end
  end
end
