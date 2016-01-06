class ProfilesController < ApplicationController
  before_filter :load_profile

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private
  def profile_params
    params.require(:profile).permit(:organization_name, :address_attributes => [:id, :door_number, :street, :city, :country, :postcode])
  end

  def load_profile
    @profile = Profile.find(params[:id])
  end
end
