class Recipe < ActiveRecord::Base
    #has_and_belongs_to_many :ingrediences, :order=>'title'
    default_scope :order => 'title ASC'
    has_many :meals#, :dependent => true
    has_many :ingrediences, :through => :meals           
    
    belongs_to :category#, :order=>'name'

    validates_presence_of :title, :description, :category_id
    validates_uniqueness_of :title, :case_sensitive => false

    def self.search(search,page,per_page)

        paginate :per_page => per_page, :page => page,
                 :conditions => ['title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"],
                :include => :category,               
                :order => 'categories.name, title'

    end

    def self.catcount(id)
        count(:all, :conditions => ['category_id = ?',id])
    end    
    
end
