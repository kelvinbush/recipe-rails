# frozen_string_literal: true

class RemoveUserRefToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :user_id
  end
end
