require "rails_helper"

RSpec.describe UserNotification, type: :mailer do
  describe "notification" do
    let(:mail) { UserNotification.notification(@provider, @charity)}

    before do
      @email = Faker::Internet.email
      @provider = User.create!(organization_name: "Pret a manger", email: @email, password: "password", type: "Provider")
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
