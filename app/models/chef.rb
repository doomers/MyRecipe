class Chef < ActiveRecord::Base
   has_many :recipes
   has_many :likes
end