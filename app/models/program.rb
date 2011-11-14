class Program < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :name
    validates_uniqueness_of :name, :case_sensitive => false

    def self.search(search,page,per_page)

        paginate :per_page => per_page, :page => page,
                 :conditions => ['name LIKE ? OR description LIKE ? OR version LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"],
                :order => 'name, version'

    end
end
