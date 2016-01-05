require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do
    before do
      @email = Faker::Internet.email
      @user = User.create!(email: @email, password: "password", profile: Profile.new(organization_name: "Food for everyone"))
      @address = Address.create!(door_number: "35", street: "Pelham Road", city: "London", country: "UK", postcode: "N16 0NM", user: @user)
    end

    it "has one profile when it created" do
      expect(User.first.profile.organization_name).to eq("Food for everyone")
      expect(Profile.all.length).to eq(1)
    end

    it "has one address" do
      expect(User.first.address.street).to eq("Pelham Road")
      expect(User.first.address.city).to eq("London")
    end
  end
end
