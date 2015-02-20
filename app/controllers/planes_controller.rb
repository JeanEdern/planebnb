class PlanesController < ApplicationController
  # Skip authentication for this controller
  skip_before_action :authenticate_user!

  def index
    @address = params['user_input_autocomplete_address']
    @range = params['range'].to_i
    @planes=Plane.near(@address, @range)
    # @booking = @pl.planes.build
    @booking = Booking.new

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@planes) do |plane, marker|
      marker.lat plane.latitude
      marker.lng plane.longitude
      marker.picture({
        url: view_context.image_path("logo.svg"),
        width: 100,
        height: 100})
      marker.title plane.price.to_s
    end
  end

  def show
    @plane = Plane.find(params[:id])
    @plane_coordinates = { lat: @plane.latitute, lng: @plane.longitude }
  end

  private

  def plane_params
    params.require(:plane).permit(:description, :aeroclub, :price, :available, :picture, :second_picture, :third_picture, :seat, :user_id)
  end

end
