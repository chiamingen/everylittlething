class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :songs
  end
end
