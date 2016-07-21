class Recipe < ActiveRecord::Base
   belongs_to :chef
   validates :chef_id, presence: true
   validates :name, presence: true
   validates :summary, presence: true
   validates :description, presence: true
   mount_uploader :picture, PictureUploader
   validates :picture_size, presence: true

   private def picture_size
      if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5 MegaBytes")
      end
   end 

end