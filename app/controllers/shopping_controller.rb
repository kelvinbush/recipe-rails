class ShoppingController < ApplicationController

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
        if food.id == id
          @missing_foods << food
        end
      end
    end
    @food_amount = @missing_foods_ids.count
    @missing_foods.each do |food|
      @total_price += food.quantity * food.price
    end
  end
end
