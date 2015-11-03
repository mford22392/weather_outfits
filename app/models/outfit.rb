class Outfit < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :temp, :name
  validates :rain, inclusion: [true, false]
  has_attached_file :image_upload, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_presence_of :image_upload
  validates_attachment_content_type :image_upload, content_type: /\Aimage\/.*\Z/


  TEMPERATURES = ['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']
end
