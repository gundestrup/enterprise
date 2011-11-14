class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
		t.column 	:name, 								:string
		t.column 	:cd_id, 							:integer
		t.column 	:song_id, 							:integer
	    #t.timestamps
		t.column     :created_at,                       :datetime
       t.column     :updated_at,                        :datetime
    end
  end

  def self.down
    drop_table :artists
  end
end
