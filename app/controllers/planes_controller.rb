class PlanesController < ApplicationController
  # Plane...

  def index
    @planes=Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
  end

  private

  def plane_params
    params.require(:plane).permit(:description, :aeroclub, :price, :available, :picture, :seat, :user_id)
  end

end
