class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friend_profiles = FriendProfile.all

    if params[:query].present?
      sql_subquery = <<~SQL
        friend_profiles.username @@ :query
        OR friend_profiles.comments @@ :query
        OR friend_profiles.address @@ :query
        OR hobbies.name @@ :query
      SQL
      @friend_profiles = @friend_profiles.joins(:hobbies).where(sql_subquery, query: params[:query]).distinct
    end

    @markers = map_markers
  end

  private

  def map_markers
    @friend_profiles.geocoded.map do |friend_profile|
      {
        lat: friend_profile.latitude,
        lng: friend_profile.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {friend_profile: friend_profile})
      }
    end
  end

end
