module Profiles
  class PlanesController < ApplicationController
    before_action :find_user
    # current_user.planes...

    def index
      @planes = @user.planes
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
        raise
        render :new
      end
    end

    def edit
      @plane = @user.planes.find(params[:id])
    end

    def update
      @plane = @user.planes.build(planes_params)
      if @plane.update_attributes(planes_params)
        raise
        redirect_to :action => 'show', :id => @plane
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
    params.require(:plane).permit(:description, :seat, :aeroclub, :available, :created_at, :updated_at, :price, :picture)
  end

  def find_user
     @user = current_user
   end
  end
end