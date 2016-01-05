require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "Address" do
    before do
      @email = Faker::Internet.email
      @charity = Charity.create!(email: @email, password: "password")
      @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", user: @charity)
      # @profile = Profile.create!(organization_name: "Food for everyone", user: @charity)
    end

    it "belongs to a user" do
      expect(Address.first.user.email).to eq(@charity.email)
    end
  end
end
