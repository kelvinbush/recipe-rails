class FoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @foods = Food.includes(:user).where(user: current_user)
  end

  def new
  end

  def create
    @food = current_user.foods.create(food_params)
    if @food.save
      flash[:notice] = 'New Food Created Successfully.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Food creation failed'
      render action: 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

end
