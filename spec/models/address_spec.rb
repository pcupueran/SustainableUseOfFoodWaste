require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "Address" do
    before do
      @email = Faker::Internet.email
      @charity = Charity.create!(email: @email, password: "password")
      @profile = Profile.create!(organization_name: "Food for everyone", user: @charity)
      @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", profile: @profile)
    end

    it "belongs to a profile" do
      expect(Address.first.profile.organization_name).to eq(@profile.organization_name)
    end
  end
end
