require 'active_record/fixtures'
class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.timestamps
    end
      add_column :movies, :location_id, :integer
      add_column :cds, :location_id, :integer

      Fixtures.reset_cache
      @directory = File.join(File.dirname(__FILE__), "data")
      Fixtures.create_fixtures(@directory, "locations")

      na = Location.find(:first, :conditions => ['name = ?', "N/A"])
      Movie.update_all ['location_id = ?', na]
  end

  def self.down
    drop_table :locations
    remove_column :movies, :location_id
    remove_column :cds, :location_id
  end
end
