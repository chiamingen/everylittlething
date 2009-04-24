class CreateDiscs < ActiveRecord::Migration
  def self.up
    create_table :discs do |t|
      t.string :name
      t.date :released_on
	  t.integer :disc_category_id
    end
  end

  def self.down
    drop_table :discs
  end
end
