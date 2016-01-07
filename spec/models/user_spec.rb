require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do
    it "raises an exception if organization_name not present" do
      @email = Faker::Internet.email
      expect{ User.create!(email: @email, password: "password") }.to raise_error("Validation failed: Organization name can't be blank")
    end

    it "creates a user and a profile if valid data is provided" do
      @email = Faker::Internet.email
      @user = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
      expect(User.all.length).to eq(1)
      expect(User.first.email).to eq(@email)
      expect(User.first.type).to eq("Charity")
    end

    it "has one profile when it is created" do
      @email = Faker::Internet.email
      @user = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
      expect(User.first.profile).not_to be_nil
      expect(Profile.all.length).to eq(1)
    end
  end
end
