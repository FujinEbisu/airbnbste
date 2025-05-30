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
    @booking.friend_profile = @friend_profile
    @booking.user = current_user
    @booking.start_date = @dates[0]
    @booking.end_date = @dates[1]
    if @booking.save
      redirect_to friend_profile_path(current_user), notice: 'Booking was successfully created.'
    else
      render 'friend_profiles/show', status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to request.referer, notice: 'Booking profile was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to users_dashboard_path(current_user), notice: 'Booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:range_date, :accepted)
  end
end
