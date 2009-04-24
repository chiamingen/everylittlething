class CreateDiscCategories < ActiveRecord::Migration
  def self.up
    create_table :disc_categories do |t|
      t.string :name
      t.integer :artist_id
    end
  end

  def self.down
    drop_table :disc_categories
  end
end
