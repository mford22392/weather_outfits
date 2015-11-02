class AddImageUploadToOutfit < ActiveRecord::Migration
  def change
    add_attachment :outfits, :image_upload
  end
end
