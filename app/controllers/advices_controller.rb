class AdvicesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :show, :delete]




  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.new
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
