require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe "Member routes" do
    before do
      @email = Faker::Internet.email
      @charity = Charity.create!(email: @email, password: "password")
      @profile = Profile.create!(organization_name: "Food for everyone", user: @charity)
    end
    describe "Show profile" do
      before do
        get :show, :id => @profile.id
      end

      it "shows profile information" do
        expect(response).to render_template(:show)
        expect(response).to have_http_status(:ok)
      end

      it "loads the expected profile" do
        binding.pry
        expect(assigns(:profile)).to eq(@profile)
      end
    end

    describe "Update profile" do
      describe "Edit profile" do
        before do
          get :edit, :id => @profile.id
        end

        it "renders the edit template" do
          expect(response).to render_template(:edit)
          expect(response.status).to eq(200)
          expect(response).to have_http_status(:ok)
        end
      end

      describe "Update profile" do
        before do
          profile = {
            organization_name: "Food for all"
          }
          get :update, :id => @profile.id, :profile => profile
        end

        it "updates the profile" do
          expect(Profile.first.organization_name).to eq("Food for all")
        end
      end
    end
  end
end
