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
        url: "https://s3-eu-west-1.amazonaws.com/planebnb/development/noun_4885_cc.svg?X-Amz-Date=20150220T082637Z&X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Signature=e9a6b4f028d24edccdc54eb5545c672b793df36cdf595884bd92d7f8d2c6d3ea&X-Amz-Credential=ASIAJIAWPMGEGLDR7WZQ/20150220/eu-west-1/s3/aws4_request&X-Amz-SignedHeaders=Host&x-amz-security-token=AQoDYXdzEHEakAJJCBWjcPanmbMG%2BNngj0yTBGvyRLz9gYFFqkAdxs9wEd2ZKPgrjkWTJj/e%2BW0N5PXm6gbkNHKIh3wBBM7yG%2B5ORbr62TqbmbcBNXX40uhfpCJSmOpX%2Bupgtc/IZTJJVZ92QeBwGzlAmPnBkYre7b6Zw4UpAT3/BR0gEYjcUBhGA6XO7cBRtAIUeLh1YbWN1oIFxWp8q2wwpo47XD6ZyJ4E7p12FtFY/o0Sm7EwpwoQLzkP6HCJ1sM%2BGFRQmR2MO6WKRey5LEreoWMKIZD/WRLwycsi7LZ011pDxP6Dx1mgjNEmCqpBT5pMVsYgaqXEHF8JXeEzZiAGOkwLU5tA3Fwsm%2BHNWROVkiFPeWTr4AbwCiC/15unBQ%3D%3D",
        width: 80,
        height: 80})
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
