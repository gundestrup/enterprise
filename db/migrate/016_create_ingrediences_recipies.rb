class CreateIngrediencesRecipies < ActiveRecord::Migration
  def self.up
    create_table :ingrediences_recipes,  :id => false do |t|
      t.integer :recipe_id
      t.integer :ingredience_id

      t.timestamps
    end

    add_index :ingrediences_recipes, [:recipe_id]
    add_index :ingrediences_recipes, [:ingredience_id]
  end

  def self.down
    drop_table :ingrediences_recipes
  end
end
