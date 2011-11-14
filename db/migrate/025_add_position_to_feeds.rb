class AddPositionToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :position, :integer
  end

  def self.down
    remove_column :feeds, :position
  end
end
