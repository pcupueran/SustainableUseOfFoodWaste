require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "Profile" do
    before do
      @email = Faker::Internet.email
      @charity = Charity.create!(email: @email, password: "password")
      @profile = Profile.create!(organization_name: "Food for everyone", user: @charity)
    end

    it "belongs to a user" do
      expect(Profile.first.user.email).to eq(@email)
    end
  end
end
