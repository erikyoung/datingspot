class SpotsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @spots = Spot.all.paginate(page: params[:page], per_page: 3)
  end

  def new
    @spot = Spot.new
  end

  def create
   @spot = current_user.spots.create(spot_params)
  if @spot.valid?
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])

    if @spot.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @spot.update_attributes(spot_params)
    if @spot.valid?
    redirect_to root_path
  else
    render :edit, status: :unprocessable_entity
  end
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
