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

    if @advice.user != current_user
    return render text: 'Not Allowed', status: :forbidden
  end

  @advice.update_attributes(advice_params)
  if @advice.valid?
    redirect_to advice_path
  else
    render :edit, status: :unprocessable_entity
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

