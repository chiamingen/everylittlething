class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name
      t.string :filename
	  t.integer :disc_id
    end
  end

  def self.down
    drop_table :songs
  end
end
