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

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    redirect_to recipe_path(@recipe) if @recipe_food.update(recipe_food_params)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end

end
