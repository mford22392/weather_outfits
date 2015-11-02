class Outfit < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :temp, :rain, :name
  has_attached_file :image_upload, url: "public/system/outfits/image_uploads"
  validates_presence_of :image_upload
  validates_attachment_content_type :image_upload, content_type: /\Aimage\/.*\Z/


  TEMPERATURES = ['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']
end
