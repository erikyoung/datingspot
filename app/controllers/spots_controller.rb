class SpotsController < ApplicationController
  def index
    @spots = Spot.all.paginate(page: params[:page], per_page: 3)
  end

  def new
    @spot = Spot.new
  end

  def create
    Spot.create(spot_params)
    redirect_to root_path
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :address)
  end
end
