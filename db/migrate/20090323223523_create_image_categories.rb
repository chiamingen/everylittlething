class CreateImageCategories < ActiveRecord::Migration
  def self.up
    create_table :image_categories do |t|
      t.string :name
	  t.string :artist_id
    end
  end

  def self.down
    drop_table :image_categories
  end
end
