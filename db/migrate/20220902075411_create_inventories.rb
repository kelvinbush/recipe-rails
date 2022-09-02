class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name

      t.timestamps
    end

    add_reference :inventories, :user, foreign_key: { to_table: :users }, index: true
  end
end
