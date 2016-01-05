require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User" do
    before do
      @email = Faker::Internet.email
      @user = User.create!(email: @email, password: "password", profile: Profile.new(organization_name: "Food for everyone"))
    end

    it "has one profile when it created" do
      expect(User.first.profile.organization_name).to eq("Food for everyone")
      expect(Profile.all.length).to eq(1)
    end
  end
end
