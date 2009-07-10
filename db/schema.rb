# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090412045411) do

  create_table "artists", :force => true do |t|
    t.string "name"
  end

  create_table "disc_categories", :force => true do |t|
    t.string  "name"
    t.integer "artist_id"
  end

  create_table "discs", :force => true do |t|
    t.string  "name"
    t.date    "released_on"
    t.integer "disc_category_id"
  end

  create_table "image_categories", :force => true do |t|
    t.string "name"
    t.string "artist_id"
  end

  create_table "images", :force => true do |t|
    t.string  "filename"
    t.integer "imageable_id"
    t.string  "imageable_type"
  end

  create_table "songs", :force => true do |t|
    t.string  "name"
    t.string  "filename"
    t.integer "disc_id"
  end

end
