class Recipe < ActiveRecord::Base
  belongs_to :vegetable
  belongs_to :protein

end 