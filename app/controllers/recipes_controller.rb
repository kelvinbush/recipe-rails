class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = Food.joins(:recipe_foods).includes(recipe_foods: :recipe)
      .select('foods.name, recipe_foods.id, recipe_foods.quantity, foods.price')
      .where("recipe_foods.recipe_id = #{params[:id]}")
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
    @recipe = Recipe.find(params[:id])
    redirect_to recipe_path(params[:id]) if @recipe.update(public: params[:public])
  end
end
