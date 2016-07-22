class Recipe < ActiveRecord::Base
   belongs_to :chef
   has_many :likes
   validates :chef_id, presence: true
   validates :name, presence: true
   validates :summary, presence: true
   validates :description, presence: true
   mount_uploader :picture, PictureUploader
   validate :picture_size

   def thumbs_up_total
    self.likes.where(like: true).size
   end
   
   def thumbs_down_total
    self.likes.where(like: false).size
   end

   private
   def picture_size
      if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5 MegaBytes")
      end
   end 

   

end