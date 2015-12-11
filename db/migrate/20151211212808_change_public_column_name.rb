class ChangePublicColumnName < ActiveRecord::Migration
  def change
    rename_column :outfits, :public, :public_setting
  end
end
