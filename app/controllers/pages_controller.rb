class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friend_profiles = FriendProfile.all
  end


end
