require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe "Member routes" do
    before do
      @email = Faker::Internet.email
      @charity = User.create!(organization_name: "Food for everyone", email: @email, password: "password", type: "Charity")
    end
    describe "Show profile" do
      before do
        get :show, :id => @charity.profile.id
      end

      it "shows profile information" do
        expect(response).to render_template(:show)
        expect(response).to have_http_status(:ok)
      end

      it "loads the expected profile" do
        expect(assigns(:profile)).to eq(@charity.profile)
      end
    end

    describe "Update profile" do
      describe "Edit profile" do
        before do
          get :edit, :id => @charity.profile.id
        end

        it "renders the edit template" do
          expect(response).to render_template(:edit)
          expect(response.status).to eq(200)
          expect(response).to have_http_status(:ok)
        end
      end

      describe "Update profile" do
        before do
          @email = Faker::Internet.email
          profile = {
            :user_attributes => {
              organization_name: "Food for all",
              email: @email
            }
          }
          # get :update, :id => @charity.profile.id, :profile => profile
        end

        it "updates the profile" do
          # expect(Profile.first.user.organization_name).to eq("Food for all")
        end
      end
    end
  end
end
