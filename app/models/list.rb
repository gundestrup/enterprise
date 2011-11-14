class List < ActiveRecord::Base
    belongs_to :ingredience
    belongs_to :purchase
    belongs_to :unit#, :order => 'name'
    
    validates_presence_of :purchase_id, :ingredience_id, :unit_id

    def self.search(search,page,per_page)
        paginate :per_page => per_page, :page => page,
                 :conditions => ['name LIKE?',  "%#{search}%"],
                :order => 'name'
    end
    
end
