class Unit < ActiveRecord::Base
    has_many :lists
    has_many :meals
end
