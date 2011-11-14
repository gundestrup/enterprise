class Purchase < ActiveRecord::Base
    belongs_to :user
    has_many :lists
    has_many :ingrediences, :through => :lists 
    
    validates_presence_of :name
    validates_uniqueness_of :name, :case_sensitive => false

    def self.search(search,page,per_page)

        paginate :per_page => per_page, :page => page,
                 :conditions => ['name LIKE ?', "%#{search}%"]

    end
    
end
