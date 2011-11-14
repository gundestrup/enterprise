class Movie < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
  belongs_to :location
  default_scope :order => 'title DESC'
    
    validates_presence_of :title
    validates_uniqueness_of :title, :case_sensitive => false

    def self.search(search,page,per_page)

        paginate :per_page => per_page, :page => page,
                 :conditions => ['title LIKE ? OR actor LIKE ? OR year LIKE ? OR plot LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"],
                :include => :category,
                :order => 'title, year, rating, categories.name'
    end

    def self.total(search)
        count(:all, :conditions => ['title LIKE ? OR actor LIKE ? OR year LIKE ? OR plot LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"],
                :include => :category)
    end

    def self.catcount(id)
        count(:all, :conditions => ['category_id = ?',id])
    end

    def self.loccount(id)
        count(:all, :conditions => ['location_id = ?',id])
    end
end
