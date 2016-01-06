require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe "Provider" do
    before do
      @email = Faker::Internet.email
      @provider = Provider.create!(email: @email, password: "password")
      @profile = Profile.create!(organization_name: "Pret a manger", user: @provider)

    end

    it "is a type of User" do
      expect(User.first.email).to eq(@email)
    end

    it "has one profile" do
      expect(Provider.first.profile.organization_name).to eq("Pret a manger")
    end
  end
end
