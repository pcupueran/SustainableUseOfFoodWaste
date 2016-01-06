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

    describe "receives an email" do

      before do
        @email = Faker::Internet.email
        @profile = Profile.create!(organization_name: "Food for everyone")
        @charity = Charity.create!(email: @email, password: "password", profile: @profile)
        @contribution = Contribution.create(provider: @provider)
        @booking = Booking.create!(contribution: @contribution, charity: @charity)
      end

      it "receives an email when a booking to collect food is created" do
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end
    end
  end
end
