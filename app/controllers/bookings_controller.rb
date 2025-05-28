class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @friend_profile = FriendProfile.find(params[:friend_profile_id])
    @dates = booking_params[:range_date].split(' to ')
    @booking = Booking.new
    @booking.start_date = DateTime.parse(@dates[0])
    @booking.end_date = DateTime.parse(@dates[1])

    @booking.friend_profile = @friend_profile
    @booking.user = current_user

    if @booking.save
      redirect_to friend_profile_path(current_user), notice: 'Booking was successfully created.'
    else
      render 'friend_profiles/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to friend_profile_path(current_user), notice: 'Booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:range_date)
  end
end
