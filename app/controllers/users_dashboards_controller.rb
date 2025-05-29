class UsersDashboardsController < ApplicationController
    before_action :set_user, only: [:dashboard]
    
    def dashboard
        @years_old = Date.today.year - @user.birthday.year
        @friends_profiles = @user.friend_profiles
        @bookings = @user.bookings
    end

    private

    def set_user
        @user = current_user
    end
end

