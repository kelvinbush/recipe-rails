class FoodsController < ApplicationController
  def index
    @user = User.first
    @foods = Food.includes(:user).where(user:)
  end

  def create
    @user = User.first
    @food = @user.foods.create(food_params)
    if @food.save
      flash[:notice] = 'New Food Created Successfully.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Food creation failed'
      render action: 'index'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    render action: 'index'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

end
