require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
  end
  describe "A profile belongs to a user" do
    @email = Faker::Internet.email
    @charity = Charity.create!(email: @email, password: "password")
    @profile = Profile.create!(organization_name: "Food for everyone", user: @charity)
    expect(Profile.first.user.email).to eq(@email)
  end
end
