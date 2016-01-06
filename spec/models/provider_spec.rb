require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe "Provider" do
    before do
      @email = Faker::Internet.email
      @profile = Profile.new(organization_name: "Pret a manger")
      @provider = Provider.create!(email: @email, password: "password", profile: @profile)
    end

    it "is a type of User" do
      expect(User.first.email).to eq(@email)
    end

    it "has one profile" do
      expect(Provider.first.profile.organization_name).to eq("Pret a manger")
    end

    it "receives an email when a booking to collect food is created" do
      @contribution = Contribution.create(provider: @provider)
      @booking = Booking.create!(contribution: @contribution)
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
