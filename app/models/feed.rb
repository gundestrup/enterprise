class Feed < ActiveRecord::Base
  acts_as_list
  default_scope :order => 'position ASC'
  
  validates_presence_of :name, :description, :link
  validates_uniqueness_of :name, :case_sensitive => false, :message => "Already present"
  validates_uniqueness_of :link, :case_sensitive => false, :message => "Already present"
  
end
