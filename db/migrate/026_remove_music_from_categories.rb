class RemoveMusicFromCategories < ActiveRecord::Migration
  def self.up
    # I am not going to use the music part after all, so removing it.
    @category = Category.find(:all, :conditions => ["music = ?", true])
    Category.destroy @category
    remove_column :categories, :music
  end

  def self.down
    add_column :categories, :music, :bool
  end
end
