class RecipeFoodsController < ApplicationController
  def new
    @foods = Food.all
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], food_id: params[:food_id], quantity: 1)
    @recipe_food.save
  end

  def destroy
    @recipe_food = RecipeFood.find_by(recipe_id: params[:recipe_id], food_id: params[:id])
    redirect_to recipe_path(params[:recipe_id]) if @recipe_food.delete
  end  
end    