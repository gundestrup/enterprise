class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string :name
      t.text :description
      t.boolean :glasses
      t.boolean :drinks
      t.boolean :foods
      t.timestamps
    end
      Fixtures.reset_cache
      @directory = File.join(File.dirname(__FILE__), "data")
      Fixtures.create_fixtures(@directory, "units")
    
      add_column :ingrediences, :weight, :string
      add_column :meals, :unit_id, :integer
      add_column :lists, :unit_id, :integer
      change_column :meals, :quantity, :string
      change_column :lists, :quantity, :string
      remove_column :meals, :lable
      remove_column :lists, :lable
      Meal.update_all ['unit_id = ?', 1]
      List.update_all ['unit_id = ?', 1]
  end

  def self.down
    drop_table :units
    remove_column :ingrediences, :weight
    remove_column :meals, :unit_id
    remove_column :lists, :unit_id
    change_column :meals, :quantity, :integer
    change_column :lists, :quantity, :integer
    add_column :meals, :lable, :string
    add_column :lists, :lable, :string
  end
end
