class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[ show edit update ]
  def show
    @profile = current_user.profile
    latest_fitlog = current_user.fitlogs.order(record_at: :desc).first
    @weight = latest_fitlog&.weight
  end
  def edit
    @profile = current_user.profile || current_user.build_profile
  end
  ##
  # Updates the current user's profile with permitted parameters.
  #
  # If the update succeeds, redirects to the profile page with a success notice. If it fails, re-renders the edit form with an alert and unprocessable entity status.
  def update
    @profile = current_user.profile || current_user.build_profile
    if @profile.update(profile_params)
      redirect_to profile_path, notice: t('profiles.update.notice')
    else
      flash.now[:alert] = t('profiles.update.alert')
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :height, :target_weight)
  end
end
