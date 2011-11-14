class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :category_id

      t.timestamps
    end
      add_column :categories, :food, :boolean
  end

  def self.down
    drop_table :recipes
    remove_column :categories, :food
  end
end
