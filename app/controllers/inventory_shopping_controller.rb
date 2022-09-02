class InventoryShoppingController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
    @recipe_foods = []
    @inventory_foods = []
    @missing_foods = []
    @food_amount = 0
    @total_price = 0
    @foods = current_user.foods

    @recipe.recipe_foods.map do |food|
      @recipe_foods << food
    end

    @inventory.inventory_foods.map do |food|
      @inventory_foods << food
    end
    @missing_foods_ids = @recipe_foods.map(&:food_id) - @inventory_foods.map(&:food_id)

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
end
