module Profiles
  class PlanesController < ApplicationController
    before_action :find_user

    def index
      @planes = @user.planes
      @bookings = find_bookings_of_planes
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
      @plane = @user.planes.find(params[:id])
    end

    def new
      @plane = @user.planes.build
      @plane.available = true
    end

    def create
      @plane = @user.planes.build(planes_params_create)
      @plane.available = true
      if @plane.save
        redirect_to profile_plane_path(@plane)
      else
        render :new
      end
    end

    def edit
      @plane = @user.planes.find(params[:id])
      @bookings = @plane.bookings
    end

    def update
      @plane = @user.planes.find(params[:id])
      @bookings = @plane.bookings
      if @plane.update_attributes(planes_params_update)
        redirect_to :action => 'show', :id => @plane.id
      else
        render :action => 'edit'
      end
    end

    def destroy
      @plane = @user.planes.find(params[:id])
      @plane.destroy
      redirect_to profile_planes_path
    end

  private

  def planes_params_create
    params.require(:plane).permit(:description, :seat, :aeroclub, :available, :created_at, :updated_at, :price, :picture, :second_picture, :third_picture, :city, :admin_area, :address, :latitude, :longitude)
  end

  def planes_params_update
    if params['booking'] == nil
      params.require(:plane).permit(:description, :seat, :aeroclub, :available, :created_at, :updated_at, :price, :picture, :second_picture, :third_picture, :city, :admin_area, :address, :latitude, :longitude)
    else
      params.require(:booking).permit(:plane_id, :status)
      params.require(:plane).permit(:description, :seat, :aeroclub, :available, :created_at, :updated_at, :price, :picture, :second_picture, :third_picture, :city, :admin_area, :address, :latitude, :longitude)
    end
  end

  def find_user
    @user = current_user
  end

  def find_bookings_of_planes
    bookings =[]
    @user.planes.each do |plane|
      bookings << plane.bookings
    end
    return bookings
  end

  end
end