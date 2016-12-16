class AdvicesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
    @advices = Advice.all
  end


  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.new(advice_params)
    redirect_to advice_path(@advice)
  end
  

  def edit
  end

  
  def show
    @advice = Advice.find(params[:id])
  end

  

private

  def advice_params
    params.require(:advice).permit(:title, :body)
  end

  def find_advice
    @advice = Advice.find(params[:id])
  end 

  

end
