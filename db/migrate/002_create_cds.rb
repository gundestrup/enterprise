class CreateCds < ActiveRecord::Migration
  def self.up
    create_table :cds do |t|
		t.column 	 :name, 							:string
		t.column 	 :artist_id, 						:integer
        t.column     :category_id,                      :integer
        t.column     :created_at,                       :datetime
        t.column     :updated_at,                       :datetime
	    #t.timestamps
    end
  end

  def self.down
    drop_table :cds
  end
end
