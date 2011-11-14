class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.integer :recipe_id
      t.integer :quantity
      t.string  :lable
      t.integer :ingredience_id      
    end
    add_index :meals, [:recipe_id]
    add_index :meals, [:ingredience_id]

     drop_table :ingrediences_recipes
  end

  def self.down
    drop_table :meals

    create_table :ingrediences_recipes,  :id => false do |t|
      t.integer :recipe_id
      t.integer :ingredience_id

      t.timestamps
    end

    add_index :ingrediences_recipes, [:recipe_id]
    add_index :ingrediences_recipes, [:ingredience_id]

  end
end
