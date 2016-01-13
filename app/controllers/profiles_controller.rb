class ProfilesController < ApplicationController
  before_filter :load_profile
  append_before_action :authenticate_user!
  append_before_action :restrict_access, :only => [:edit]

  def update
    @profile.update!(profile_params)
    redirect_to profile_path(@profile)
  end

  private
  def profile_params
    params.require(:profile).permit(:user_attributes => [:id, :organization_name, :email], :address_attributes => [:id, :door_number, :street, :city, :country, :postcode])
  end

  def load_profile
    @profile = Profile.find(params[:id])
  end

  def restrict_access
    render :status => 403, :text => "Forbidden profile" unless current_user == @profile.user
  end
end
