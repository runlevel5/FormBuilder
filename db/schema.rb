# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110628084038) do

  create_table "fields", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.float    "eps_x"
    t.float    "eps_y"
    t.float    "eps_width"
    t.float    "eps_height"
    t.integer  "width"
    t.integer  "height"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "fields", ["page_id"], :name => "index_fields_on_page_id"

  create_table "pages", :force => true do |t|
    t.integer  "template_id",       :null => false
    t.string   "name"
    t.text     "page_meta"
    t.string   "page_file_name"
    t.string   "page_content_type"
    t.integer  "page_file_size"
    t.datetime "page_updated_at"
  end

  add_index "pages", ["template_id"], :name => "index_pages_on_template_id"

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "template_file_name"
    t.string   "template_content_type"
    t.integer  "template_file_size"
    t.datetime "template_updated_at"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
