class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friend_profiles = FriendProfile.all
    @markers = map_markers
  end

  private
  def map_markers
    @friend_profiles = FriendProfile.geocoded
    @markers = @friend_profiles.map do |friend_profile|
      {
        lat: friend_profile.latitude,
        lng: friend_profile.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {friend_profile: friend_profile})
      }
    end
  end

end
