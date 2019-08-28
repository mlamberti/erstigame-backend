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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_14_204700) do

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "name", null: false
    t.string "info"
    t.text "description"
    t.string "picture"
    t.integer "points", default: 100, null: false
    t.time "repeat_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags_photos", id: false, force: :cascade do |t|
    t.integer "photo_id", null: false
    t.integer "hashtag_id", null: false
    t.index ["hashtag_id", "photo_id"], name: "index_hashtags_photos_on_hashtag_id_and_photo_id"
    t.index ["photo_id", "hashtag_id"], name: "index_hashtags_photos_on_photo_id_and_hashtag_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.string "path", null: false
    t.datetime "date", null: false
    t.integer "people_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_photos_on_group_id"
    t.index ["path"], name: "index_photos_on_path", unique: true
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "group_id"
    t.string "name", null: false
    t.string "info"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_users_on_group_id"
  end

end
