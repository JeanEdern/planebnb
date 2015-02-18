class PlanesController < ApplicationController
  # Skip authentication for this controller
  skip_before_action :authenticate_user!

  def index
    @planes=Plane.all
    # @booking = @pl.planes.build
    @booking = Booking.new
  end

  def show
    @plane = Plane.find(params[:id])
  end

  private

  def plane_params
    params.require(:plane).permit(:description, :aeroclub, :price, :available, :picture, :seat, :user_id)
  end

end
