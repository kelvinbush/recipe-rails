class ShoppingController < ApplicationController
  # rubocop:disable Metrics
  def index
    @food_amount = 0
    @total_price = 0
    @recipe_foods = []
    @missing_foods = []
    @foods = current_user.foods
    @recipes = current_user.recipes
    @recipes.includes(:recipe_foods).each do |recipe|
      recipe.recipe_foods.map do |food|
        @recipe_foods << food
      end
    end
    @missing_foods_ids = @foods.map(&:id) - @recipe_foods.map(&:food_id)
    @missing_foods_ids.map do |id|
      @foods.map do |food|
        @missing_foods << food if food.id == id
      end
    end
    @food_amount = @missing_foods_ids.count
    @missing_foods.each do |food|
      @total_price += food.quantity * food.price
    end
  end
  # rubocop:enable Metrics
end
