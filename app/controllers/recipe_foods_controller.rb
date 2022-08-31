class RecipeFoodsController < ApplicationController
  def new
    @foods = Food.all
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], food_id: params[:food_id], quantity: params[:quantity])
    @recipe_food.save
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    redirect_to recipe_path(params[:recipe_id]) if @recipe_food.delete
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    redirect_to recipe_path(params[:recipe_id]) if @recipe_food.update(quantity: params[:quantity])
  end

end    