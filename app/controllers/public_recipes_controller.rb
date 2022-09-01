class PublicRecipesController < ApplicationController
  def index
    @recipes = User.joins(:recipes).includes(recipes: :user)
      .select('users.name as user_name, recipes.id, recipes.name as recipe_name')
      .where("recipes.public = 'yes'")

    @recipes_public = []
    @recipes.each do |recipe|
      recipe_food = Food.joins(:recipe_foods).includes(recipe_foods: :recipe)
        .select('foods.name, recipe_foods.id, recipe_foods.quantity, foods.price')
        .where("recipe_foods.recipe_id = #{recipe.id}")
      total_price = 0
      recipe_food.each do |element|
        total_price += element.price.to_i
      end
      @recipes_public << { recipe:, recipe_food:, total_price: }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = Food.joins(:recipe_foods).includes(recipe_foods: :recipe)
      .select('foods.name, recipe_foods.id, recipe_foods.quantity, foods.price')
      .where("recipe_foods.recipe_id = #{params[:id]}")
  end
end
