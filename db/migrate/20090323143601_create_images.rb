class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :filename
	  # t.integer :image_category_id

	  t.references :imageable, :polymorphic => true
    end
  end

  def self.down
    drop_table :images
  end
end
