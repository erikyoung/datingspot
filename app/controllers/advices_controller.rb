class AdvicesController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]


  def index
    @advices = Advice.all
  end

  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.new
    if @advice.save(advice_params)
      flash[:notice] = "Successfully created advice!"
      redirect_to advices_path(@advice)
    else
      flash[:alert] = "Error creating new advice!"
      render :new
    end
  end

  def edit
  end

  def update
    if @advice.update_attributes(advice_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to advices_path(@advices)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  def show
  end

  def destroy
    if @advice.destroy
      flash[:notice] = "Successfully deleted advice!"
      redirect_to advices_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

private

  def advice_params
    params.require(:advice).permit(:title, :body)
  end

  def find_post
    @advice = Advice.find(params[:id])
  end

end
