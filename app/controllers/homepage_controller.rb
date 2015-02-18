class HomepageController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @booking = Booking.new
  end
end
