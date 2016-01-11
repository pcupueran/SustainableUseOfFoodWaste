require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "Profile" do
    describe "Charity" do
      before do
        @email = Faker::Internet.email
        @charity = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
        address_params = {
          door_number: "35",
          street: "Pelham Road",
          city: "London",
          country: "UK",
          postcode: "N22 6LN"
        }
        @charity.profile.address.update!(address_params)
      end

      it "belongs to a user" do
        expect(Profile.first.user.email).to eq(@email)
      end

      it "has one address" do
        expect(Profile.first.address.street).to eq("Pelham Road")
        expect(Profile.first.address.postcode).to eq("N22 6LN")
      end
    end

    describe "Provider" do
      before do
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
        @email_provider = Faker::Internet.email
        @provider = User.create!(organization_name: "Pret a manger", email: @email_provider, password: "password", type: "Provider")
        address_params = {
          door_number: "35",
          street: "Oxford Street",
          city: "London",
          country: "UK",
          postcode: "W1D 2DT"
        }
         @provider.profile.address.update!(address_params)
      end
      it "belongs to a user" do
        expect(Profile.first.user.email).to eq(@email_provider)
      end

      it "has one address" do
        expect(Profile.first.address.street).to eq("Oxford Street")
        expect(Profile.first.address.postcode).to eq("W1D 2DT")
      end
    end
  end
end
