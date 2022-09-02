class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity

      t.timestamps
    end
    add_reference :inventory_foods, :food, foreign_key: { to_table: :foods }, index: true
    add_reference :inventory_foods, :inventory, foreign_key: { to_table: :inventories }, index: true
  end
end
