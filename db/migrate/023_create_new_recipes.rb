class CreateNewRecipes < ActiveRecord::Migration
  def self.up
      add_column :recipes, :kj, :integer #(KJ energi)
      add_column :recipes, :fe, :integer #Fedt energi %
      add_column :recipes, :kcal, :integer # Kcalc energi
      add_column :recipes, :time_prep, :integer # preperation time
      add_column :recipes, :time_work, :integer # work time
      add_column :recipes, :freezeable, :bool # can you freeze it afterwards?
  end

  def self.down
    remove_column :recipes, :kj, :integer
    remove_column :recipes, :fe, :integer
    remove_column :recipes, :kcal, :integer
    remove_column :recipes, :time_prep, :integer
    remove_column :recipes, :time_work, :integer
    remove_column :recipes, :freezeable, :bool
  end
end
