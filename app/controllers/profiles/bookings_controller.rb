module Profiles
  class BookingsController < ApplicationController
    before_action :find_user
    # current_user.planes...

    def index
      @bookings = find_bookings
    end

    def pending
      @plane = Plane.find(params[:plane_id])
      @bookings = @plane.bookings
    end

    def validate_booking
      @booking = Booking.find(params["booking"]["id"].to_i)
      if params['status-checkbox'] == "on"
        @booking.status = true
        @booking.save
      else
        @booking.status = false
        @booking.save
      end
      @bookings = find_bookings
      redirect_to pending_path
    end

   private

    def find_user
      @user = current_user
    end

    def booking_params
      params.require(:booking).permit(:status)
    end

    def find_bookings
      bookings =[]
      @user.planes.each do |plane|
        bookings << plane.bookings
      end
      return bookings
    end
  end
end