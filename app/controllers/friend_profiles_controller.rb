class FriendProfilesController < ApplicationController
  before_action :set_friend_profile, only: [:show, :edit, :update, :destroy]

  def index
    @friend_profiles = FriendProfile.all
  end

  def show
    @friend_profile = FriendProfile.find(params[:id])
    @booking = Booking.new

    @datebookings = []
    bookings = Booking.where(friend_profile_id: @friend_profile.id, accepted: true)
    if bookings.any?
      @datebookings = bookings.map do |booking|
        {
          from: booking.start_date.strftime('%Y-%m-%d'),
          to: booking.end_date.strftime('%Y-%m-%d')
        }
      end
    end

    @markers = if @friend_profile.geocoded?
      [{
        lat: @friend_profile.latitude,
        lng: @friend_profile.longitude,
        info_window_html: render_to_string(
          partial: "info_map",
          locals: { friend_profile: @friend_profile }
        )
      }]
    else
      []
    end
  end

  def new
    @friend_profile = FriendProfile.new
  end

  def create
    @hobbies_id = friend_profile_params["hobbies_ids"]
    @friend_profile = FriendProfile.new(friend_profile_params)

    @friend_profile.user = current_user

    if @friend_profile.save
      @hobbies_id.each do |hobby_id|
        Interrest.new(hobbie_id: hobby_id, friend_profile: @friend_profile).save
      end
      redirect_to friend_profile_path(@friend_profile), notice: 'Friend profile was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @friend_profile = FriendProfile.find(params[:id])
  end

  def update
    @friend_profile = FriendProfile.find(params[:id])
    if @friend_profile.update(friend_profile_params)
      redirect_to friend_profile_path(@friend_profile), notice: 'Friend profile was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @friend_profile = FriendProfile.find(params[:id])
    @friend_profile.destroy
    redirect_to friend_profiles_path, notice: 'Friend profile was successfully deleted.'
  end

  private

  def friend_profile_params
    params.require(:friend_profile).permit(:username, :day_rate, :photo, :comments, :address, hobbies_ids: [])
  end

  def set_friend_profile
    @friend_profile = FriendProfile.find(params[:id])
  end
end
