class Outfit < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :temp, :rain, :name
  has_attached_file :image_upload, path: "app/assets/images"
  validates_attachment_presence :image_upload
  validates_attachment_content_type :image_upload, content_type: /\Aimage\/.*\Z/

  TEMPERATURES = ['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']
end
