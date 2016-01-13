require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe "Provider" do
    before do
      @email = Faker::Internet.email
      @provider = User.create!(organization_name: "Pret a manger", email: @email, password: "password", type: "Provider")
    end

    it "is a type of User" do
      expect(User.first.email).to eq(@email)
    end

    it "has one profile" do
      expect(Provider.first.profile.user.organization_name).to eq("Pret a manger")
    end

    describe "receives an email" do

      before do
        @email = Faker::Internet.email
        @date = Faker::Date.forward(7)
        @profile = Profile.create!()
        @charity = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
        @contribution = Contribution.create(collection_date: @date, user: @provider)
        @booking = Booking.create!(contribution: @contribution, charity: @charity)
      end

      it "receives an email when a booking to collect food is created" do
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end
    end
  end
end
