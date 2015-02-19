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
        "url" => "https://s3-eu-west-1.amazonaws.com/planebnb/plane_logo.svg?X-Amz-Date=20150219T194137Z&X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Signature=65494e793ca0210168a56d0d1a3f16211f38cf1b2754814158e8a5214b253b7f&X-Amz-Credential=ASIAI3TRXIUKKAFGUVFA/20150219/eu-west-1/s3/aws4_request&X-Amz-SignedHeaders=Host&x-amz-security-token=AQoDYXdzEGUakALXn6C5jwJ/RSrHUBTWswGSAkFcd%2BT9G5hmiZw63P1ECxq75zfng5hB2DXd7cU%2B95fyL66%2BjPvaz6YV8RacfvqnefdsNX3mw6uCkBLptJr0mTwGDVu2Mtgyi07ahbuJzs//Ggy3Hg%2B3fDRSi8D52Bl1XZJmGOOHyAHZMnMQHOLJuEUECLDBYpsYJjmZuK/1ynyXHKnnU0BRzum7dG8iAtx2zp3VOGG3biqJ1xon5ddw24TJ8Eqag7u6%2BkZJoG5/9KQoVJUdw1TQabaR4MFG9TvoV5pC4gHUn3BmuP7fx%2BPHT4RFjSf3E6%2BBP7vPRBWc5ld3OgXXzKHYIRkcIXahwtpI/DStBvnuypwD176xiyA%2BsCD97pinBQ%3D%3D",
        "width" => 32,
        "height" => 32})
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
