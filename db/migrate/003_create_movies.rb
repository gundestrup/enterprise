class CreateMovies < ActiveRecord::Migration
  def self.up
	create_table :movies do |t|
		t.column 	:title, 							:string
        t.column    :actor,                             :string
        t.column    :year,                              :integer
        t.column    :plot,                              :text
        t.column    :rating,                            :integer
        t.column    :category_id,                       :integer
        t.column	:user_id,							:integer
        t.column    :own,                               :boolean
        t.column    :rented,                            :boolean
        t.column    :link,                              :string
        #t.timestamps
		t.column    :created_at,                        :datetime
       t.column     :updated_at,                        :datetime
    end
  end

  def self.down
    drop_table :movies
  end
end
