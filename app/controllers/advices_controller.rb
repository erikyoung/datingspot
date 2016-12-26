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
    @advice = Advice.create(advice_params)
    redirect_to advices_path
  
  end
end

  def edit
    @advice.Advice.find(params[:id])
  end

  def update
    @advice = Advice.find(params[:id])

    if @advice.update(params[:advice].permit(:title, :body))
      redirect_to @advice

    else
      render 'edit'
    end 
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

