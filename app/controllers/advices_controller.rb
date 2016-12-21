class AdvicesController < ApplicationController
  before_action :authenticate_user!
  before_action :advice_find, only: [:edit, :update, :show, :delete]

  def index
    @advices = Advice.all.order('created_at DESC')
  end


  def new
    @advice = Advice.new

  end

  def create
    @advice = Advice.new(advice_params)
    if @advice.valid?
    redirect_to advices_path
  else
    return render :new, status: :unprocessable_entity
  end
end
  
  

  def edit
    @advice.Advice.find(params[:id])
  end

  
  def show
    @advice = Advice.find(params[:id])
  end
  

private

  def advice_params
    params.require(:advice).permit(:title, :body)
  end

  def advice_find
    @advice = Advice.find(params[:id])
  end 
end
