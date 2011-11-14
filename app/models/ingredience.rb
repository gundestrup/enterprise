class Ingredience < ActiveRecord::Base
    #has_and_belongs_to_many :recipes, :order=>'title'
    default_scope :order => 'title ASC'
    has_many :meals#, :dependent => true
    has_many :recipes, :through => :meals
    
    has_many :lists#, :dependent => true
    has_many :purchases, :through => :lists

    #has_many :purchases
    validates_presence_of :title
    validates_uniqueness_of :title, :case_sensitive => false

    def self.search(search,page,per_page)

        paginate :per_page => per_page, :page => page,
                 :conditions => ['title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"],                
                :order => 'title'

    end
end
