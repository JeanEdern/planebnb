module Profiles
  class PlanesController < ApplicationController
    before_action :find_user
    # current_user.planes...

    def index
      @planes = @user.planes

      # Let's DYNAMICALLY build the markers for the view.
      @markers = Gmaps4rails.build_markers(@planes) do |plane, marker|
        marker.lat plane.latitude
        marker.lng plane.longitude
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
      @plane = @user.planes.build(planes_params)
      @plane.available = true
      if @plane.save
        redirect_to profile_plane_path(@plane)
      else
        render :new
      end
    end

    def edit
      @plane = @user.planes.find(params[:id])
    end

    def update
      @plane = @user.planes.find(params[:id])
      if @plane.update_attributes(planes_params)
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

  def planes_params
    params.require(:plane).permit(:description, :seat, :aeroclub, :available, :created_at, :updated_at, :price, :picture, :second_picture, :third_picture, :city, :admin_area, :address, :latitude, :longitude)
  end

  def find_user
     @user = current_user
   end
  end
end