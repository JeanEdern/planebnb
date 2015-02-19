module Users
  class BookingsController < ApplicationController
    before_action :find_user

    def index
      @bookings = @user.bookings
    end

    def new
      @booking = @user.bookings.build
    end

    def create
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      if @booking.save
        redirect_to bookings_path
      else
        redirect_to planes_path
      end
    end

    private

    def booking_params
      params.require(:booking).permit(:user_id, :plane_id, :people, :check_in, :check_out, :created_at, :updated_at)
    end

    def find_user
       @user = current_user
    end
  end
end

