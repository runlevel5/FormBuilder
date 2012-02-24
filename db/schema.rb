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

ActiveRecord::Schema.define(:version => 20110610004321) do

  create_table "alignments", :force => true do |t|
    t.string "name",  :limit => 100
    t.string "value", :limit => 45
  end

  create_table "colors", :force => true do |t|
    t.string "name",  :limit => 100
    t.string "value", :limit => 45
  end

  create_table "fonts", :force => true do |t|
    t.string "name", :limit => 100
  end

  create_table "papersizes", :force => true do |t|
    t.string  "name",    :limit => 100
    t.float   "inch_x"
    t.float   "inch_y"
    t.integer "mm_x"
    t.integer "mm_y"
    t.integer "point_x"
    t.integer "point_y"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author",     :default => "Anonymous"
  end

  create_table "rows", :force => true do |t|
    t.integer "value"
  end

  create_table "sizes", :force => true do |t|
    t.string "name", :limit => 100
  end

  create_table "template_assets", :force => true do |t|
    t.string  "name",          :limit => 50
    t.text    "content"
    t.integer "asset_type_id"
    t.integer "column"
  end

  create_table "template_fields", :force => true do |t|
    t.integer "template_page_id",                 :null => false
    t.integer "template_asset_id",                :null => false
    t.integer "pos_x"
    t.integer "pos_y"
    t.integer "eps_x"
    t.integer "eps_y"
    t.integer "width"
    t.integer "height"
    t.string  "font",              :limit => 100
    t.string  "color",             :limit => 45
    t.string  "size",              :limit => 45
    t.string  "grid",              :limit => 100
    t.integer "num_rows"
    t.integer "borders"
    t.string  "align",             :limit => 45
  end

  add_index "template_fields", ["template_asset_id"], :name => "template_asset_id"
  add_index "template_fields", ["template_page_id"], :name => "template_page_id"

  create_table "template_pages", :force => true do |t|
    t.integer "template_id",                :null => false
    t.string  "name",         :limit => 50
    t.string  "png_location"
    t.string  "eps_location"
    t.integer "width"
    t.integer "height"
  end

  add_index "template_pages", ["template_id"], :name => "template_id"

  create_table "templates", :force => true do |t|
    t.string  "name",       :limit => 200
    t.string  "location",   :limit => 200
    t.string  "paper_size", :limit => 45
    t.integer "landscape"
  end

end
