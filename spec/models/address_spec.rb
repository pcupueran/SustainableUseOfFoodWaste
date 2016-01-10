require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "Address" do
    before do
      @email = Faker::Internet.email
      @charity = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
      @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N22 6LN", profile: @charity.profile)
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
        expect(@address.geocode_string).to eq('35 Pelham Road, N22 6LN, London, UK')
      end

      it "geocodes an geocode_string" do
        @address.geocode

        expect(@address.latitude).to eq(51.5951093)
        expect(@address.longitude).to eq(-0.1067676)
      end

      it "geocodes on save" do
        @address.save!
        expect(@address.latitude).to eq(51.5951093)
        expect(@address.longitude).to eq(-0.1067676)
      end
    end
  end
end
