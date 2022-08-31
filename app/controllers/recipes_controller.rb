class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = Food.includes(:recipe_foods).where("recipe_foods.recipe_id = #{params[:id]}").references(:recipe_foods)
    @recipe_food_data = RecipeFood.where(recipe_id: params[:id]).joins(:foods)
    
  end  

  def new
    @recipe = Recipe.new
  end  

  def create
    @recipe = Recipe.new(recipe_params)
    redirect_to recipes_path if @recipe.save
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.includes(:recipe).where(recipe: @recipe)
    
    @recipe_food.delete_all
    redirect_to recipes_path if @recipe.delete
  end  

  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, :preparatio_time, :cooking_time)
  end  
  
  def update
    
  end  
end
 