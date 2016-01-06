require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do
    it "raises an exception if profile not present" do
      @email = Faker::Internet.email
      expect{ User.create!(email: @email, password: "password") }.to raise_error("Validation failed: Profile can't be blank")
    end

    it "has one profile when it is created" do
      @email = Faker::Internet.email
      @user = User.create!(email: @email, password: "password", profile: Profile.new(organization_name: "Food for everyone"))
      expect(User.first.profile.organization_name).to eq("Food for everyone")
      expect(Profile.all.length).to eq(1)
    end
  end
end
