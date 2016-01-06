require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "Profile" do
    before do
      @email = Faker::Internet.email
      @charity = Charity.create!(email: @email, password: "password")
      @profile = Profile.create!(organization_name: "Food for everyone", user: @charity)
      @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", profile: @profile)
    end

    it "belongs to a user" do
      expect(Profile.first.user.email).to eq(@email)
    end

    it "has one address" do
      expect(Profile.first.address.street).to eq("Pelham Road")
      expect(Profile.first.address.city).to eq("London")
    end
  end
end
