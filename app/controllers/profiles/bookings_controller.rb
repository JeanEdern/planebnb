module Profiles
  class BookingsController < ApplicationController
    before_action :find_user
    # current_user.planes...

    def index
      @bookings = find_bookings
    end

   private

    def find_user
       @user = current_user
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