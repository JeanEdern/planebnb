class PlanesController < ApplicationController
  # Skip authentication for this controller
  skip_before_action :authenticate_user!

  def index
    @planes=Plane.all
    # @booking = @pl.planes.build
    @booking = Booking.new

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@planes) do |plane, marker|
      marker.lat plane.latitude
      marker.lng plane.longitude
    end
  end

  def show
    @plane = Plane.find(params[:id])
    @plane_coordinates = { lat: @plane.latitute, lng: @plane.longitude }
  end

  private

  def plane_params
    params.require(:plane).permit(:description, :aeroclub, :price, :available, :picture, :seat, :user_id)
  end

end
