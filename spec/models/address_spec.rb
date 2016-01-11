require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "Address" do
    before do
      @email = Faker::Internet.email
      @charity = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
      @address_params = {
        door_number: "35",
        street: "Pelham Road",
        city: "London", country: "UK",
        postcode: "N22 6LN"
      }
      @charity.profile.address.update!(@address_params)
    end

    it "belongs to a profile" do
      expect(Address.first.profile.user.organization_name).to eq(@charity.organization_name)
    end

    describe "Geolocation" do
      Geocoder::Lookup::Test.add_stub(
        "35 Pelham Road, N22 6LN, London, UK", [
          {
            'latitude'     => 51.5951093,
            'longitude'    => -0.1067676,
            'address'      => '35 Pelham Rd, Wood Green, London N22 6LN, UK',
            'city'         => 'London',
            'postal_code'  => 'N22 6LN',
            'country'      => 'United Kingdom',
            'country_code' => 'UK'
          }
        ]
      )

      it "builds a string for geocoding" do
        expect(@charity.profile.address.geocode_string).to eq('35 Pelham Road, N22 6LN, London, UK')
      end

      it "geocodes an geocode_string" do
        @charity.profile.address.geocode

        expect(@charity.profile.address.latitude).to eq(51.5951093)
        expect(@charity.profile.address.longitude).to eq(-0.1067676)
      end

      it "geocodes on update" do
        @charity.profile.address.update!(@address_params)
        expect(@charity.profile.address.latitude).to eq(51.5951093)
        expect(@charity.profile.address.longitude).to eq(-0.1067676)
      end
    end
  end
end
