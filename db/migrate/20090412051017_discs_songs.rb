class DiscsSongs < ActiveRecord::Migration
  def self.up
    create_table :discs_songs, :id => false do |t|
      t.integer :disc_id
      t.integer :song_id
    end
  end

  def self.down
  end
end
