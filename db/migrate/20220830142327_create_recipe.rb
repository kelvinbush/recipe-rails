# frozen_string_literal: true

class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparatio_time
      t.string :cooking_time
      t.text :description
      t.string :public

      t.timestamps
    end
  end
end
