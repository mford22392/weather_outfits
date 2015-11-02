class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :temp
      t.boolean :rain
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
