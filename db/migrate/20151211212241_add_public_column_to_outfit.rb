class AddPublicColumnToOutfit < ActiveRecord::Migration
  def change
    add_column :outfits, :public, :boolean
  end
end
