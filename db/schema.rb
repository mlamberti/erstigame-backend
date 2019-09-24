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

ActiveRecord::Schema.define(version: 2019_09_24_193116) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "group_rallye_ratings", force: :cascade do |t|
    t.integer "group_id"
    t.integer "rallye_rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_rallye_ratings_on_group_id"
    t.index ["rallye_rating_id"], name: "index_group_rallye_ratings_on_rallye_rating_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "join_token"
    t.integer "level_id"
    t.integer "points", default: 0, null: false
    t.integer "num_catches", default: 0, null: false
    t.integer "num_places", default: 0, null: false
    t.integer "num_sponsors", default: 0, null: false
    t.integer "time_together", default: 0, null: false
    t.index ["join_token"], name: "index_groups_on_join_token", unique: true
    t.index ["level_id"], name: "index_groups_on_level_id"
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
    t.integer "level_id"
    t.datetime "start_date"
    t.integer "category"
    t.index ["level_id"], name: "index_hashtags_on_level_id"
  end

  create_table "hashtags_photos", id: false, force: :cascade do |t|
    t.integer "photo_id", null: false
    t.integer "hashtag_id", null: false
    t.index ["hashtag_id", "photo_id"], name: "index_hashtags_photos_on_hashtag_id_and_photo_id"
    t.index ["photo_id", "hashtag_id"], name: "index_hashtags_photos_on_photo_id_and_hashtag_id"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "rank"
    t.integer "num_hours"
    t.integer "num_places"
    t.integer "num_sponsors"
    t.integer "num_catches"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.datetime "date", null: false
    t.integer "people_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0, null: false
    t.index ["group_id"], name: "index_photos_on_group_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "rallye_ratings", force: :cascade do |t|
    t.integer "rallye_station_id", null: false
    t.integer "points", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rallye_station_id"], name: "index_rallye_ratings_on_rallye_station_id"
  end

  create_table "rallye_stations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "group_id"
    t.string "name", null: false
    t.string "info"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
  end

end
