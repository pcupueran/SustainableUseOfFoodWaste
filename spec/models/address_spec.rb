require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "Address" do
    before do
      @email = Faker::Internet.email
      @charity = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
      @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", profile: @charity.profile)
    end

    it "belongs to a profile" do
      expect(Address.first.profile.user.organization_name).to eq(@charity.organization_name)
    end
  end
end
