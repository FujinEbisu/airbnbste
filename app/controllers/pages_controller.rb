class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friend_profiles = FriendProfile.all
    @markers = map_markers
  end

  private
  def map_markers
    @friend_profiles = FriendProfile.all
    @markers = @friend_profiles.geocode do |friend_profile|
      {
        lat: friend_profile,
        lng: friend_profile
      }
    end
  end

end
