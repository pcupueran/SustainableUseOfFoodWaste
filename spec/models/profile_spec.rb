require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "Profile" do
    describe "Charity" do
      before do
        @email = Faker::Internet.email
        @charity = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
        @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", profile: @charity.profile)
      end

      it "belongs to a user" do
        expect(Profile.first.user.email).to eq(@email)
      end

      it "has one address" do
        expect(Profile.first.address.street).to eq("Pelham Road")
        expect(Profile.first.address.postcode).to eq("N16 0NM")
      end
    end

    describe "Provider" do
      before do
        @email_provider = Faker::Internet.email
        @provider = User.create!(organization_name: "Pret a manger", email: @email_provider, password: "password", type: "Provider")
        @address_provider = Address.create!(door_number: "3", street: "Oxford Street", city: "London", country: "UK", postcode: "SW16 4RN", profile: @provider.profile)
      end
      it "belongs to a user" do
        expect(Profile.first.user.email).to eq(@email_provider)
      end

      it "has one address" do
        expect(Profile.first.address.street).to eq("Oxford Street")
        expect(Profile.first.address.postcode).to eq("SW16 4RN")
      end
    end

  end
end
