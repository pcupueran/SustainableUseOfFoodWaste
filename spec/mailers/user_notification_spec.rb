require "rails_helper"

RSpec.describe UserNotification, type: :mailer do
  describe "notification" do
    let(:mail) { UserNotification.notification(@provider, @charity)}

    before do
      @email = Faker::Internet.email
      @profile = Profile.new(organization_name: "Pret a manger")
      @provider = Provider.create!(email: @email, password: "password", profile: @profile)
    end

    it "has as subject" do
      expect(mail.subject).to eq("The following charity has booked this contribution")
    end

    it "has as recipient" do
      expect(mail.to).to eq([@provider.email])
    end

    it "has as sender" do
      expect(mail.from).to eq(["usingfoodwaste@org.uk"])
    end
  end
end
