class Recipe < ActiveRecord::Base
   belongs_to :chef
   validates :chef_id, presence: true
   validates :name, presence: true
   validates :summary, presence: true
   validates :description, presence: true
end