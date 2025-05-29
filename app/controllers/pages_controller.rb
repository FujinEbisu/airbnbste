class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friend_profiles = FriendProfile.all
    @markers = @friend_profiles.geocoded.map do |friend_profile|
      {
        lat: friend_profile,
        lng: friend_profile
      }
    end
  end


end
