class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
		t.column 		:name, 								:string
		t.column 		:user_id, 							:integer
	    #t.timestamps
		t.column	    :created_at,                        :datetime
       t.column     	:updated_at,                        :datetime
    end
  end

  def self.down
    drop_table :programs
  end
end
