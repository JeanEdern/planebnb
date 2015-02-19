module Profiles
  class PlanesController < ApplicationController
    before_action :find_user

    def index
      @planes = @user.planes
      @bookings = find_bookings_of_planes
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
    params.require(:plane).permit(:description, :seat, :aeroclub, :available, :created_at, :updated_at, :price, :picture)
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