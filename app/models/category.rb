class Category < ActiveRecord::Base
    has_many :movies
    has_many :recipes
      default_scope :order => 'name ASC'
    validates_presence_of :name
    validates_uniqueness_of :name, :case_sensitive => false
    
    def self.search(search,page,per_page)
        paginate :per_page => per_page, :page => page,
                 :conditions => ['name LIKE ?', "%#{search}%" ],
                    :order => 'name'

    end

    #Recipe (food)search
    def self.rsearch(search,page,per_page)
        paginate(:per_page => per_page, :page => page, :conditions => ['food = ? AND name LIKE ?', true, "%#{search}%" ],
                    :order => 'name')

    end

    #Film (Movie) search
    def self.fsearch(search,page,per_page)
        paginate(:per_page => per_page, :page => page, :conditions => ['film = ? AND name LIKE ?', true, "%#{search}%" ],
                    :order => 'name')

    end

    #Music search
    def self.msearch(search,page,per_page)
        paginate(:per_page => per_page, :page => page, :conditions => ['music = ? AND name LIKE ?', true, "%#{search}%" ],
                    :order => 'name')

    end

end
