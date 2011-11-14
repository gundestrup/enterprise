class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
		t.column 	:name, 								:string
		t.column 	:cd_id, 							:integer
		t.column 	:artist_id, 						:integer
	    #t.timestamps
		t.column    :created_at,                        :datetime
       t.column     :updated_at,                        :datetime
    end
  end

  def self.down
    drop_table :songs
  end
end
