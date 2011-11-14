class Meal < ActiveRecord::Base
    belongs_to :recipe
    belongs_to :ingredience
    belongs_to :unit#, :order => 'name'
    
    validates_presence_of :recipe_id, :ingredience_id, :unit_id

    def self.search(search,page,per_page)
        paginate :per_page => per_page, :page => page,
                 :conditions => ['quantity LIKE?',  "%#{search}%"]                
    end

    def self.ingrediensecount(id)
        count(:all, :conditions => ['ingredience_id = ?',id])
    end

end
