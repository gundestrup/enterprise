class CleanupSongCdArtist < ActiveRecord::Migration
  def self.up
      drop_table :cds
      drop_table :songs
      drop_table :artists
  end

  def self.down
      create_table :cds do |t|

      t.timestamps
      end

      create_table :songs do |t|

      t.timestamps
      end

      create_table :artists do |t|

      t.timestamps
    end
  end
end
