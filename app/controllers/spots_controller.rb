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

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update_attributes(spot_params)
    redirect_to root_path
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to root_path
  end
  private

  def spot_params
    params.require(:spot).permit(:name, :description, :address)
  end
end
