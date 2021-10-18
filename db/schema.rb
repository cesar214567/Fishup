# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_18_201300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bait_catches", force: :cascade do |t|
    t.bigint "catch_id", null: false
    t.bigint "bait_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bait_id"], name: "index_bait_catches_on_bait_id"
    t.index ["catch_id"], name: "index_bait_catches_on_catch_id"
  end

  create_table "baits", force: :cascade do |t|
    t.string "cost"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catch_spots", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "catch_id", null: false
    t.string "rarity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catch_id"], name: "index_catch_spots_on_catch_id"
    t.index ["spot_id"], name: "index_catch_spots_on_spot_id"
  end

  create_table "catches", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "habitat"
    t.string "scientific_name"
    t.float "minimum_size"
    t.float "maximum_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "liked_spots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_liked_spots_on_spot_id"
    t.index ["user_id"], name: "index_liked_spots_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.bigint "catch_id", null: false
    t.string "title"
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catch_id"], name: "index_posts_on_catch_id"
    t.index ["spot_id"], name: "index_posts_on_spot_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.string "name"
    t.string "description"
    t.string "loc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "country"
    t.string "city"
    t.string "address"
    t.datetime "birth_date"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verify_catch_spots", force: :cascade do |t|
    t.bigint "catch_spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["catch_spot_id"], name: "index_verify_catch_spots_on_catch_spot_id"
    t.index ["user_id"], name: "index_verify_catch_spots_on_user_id"
  end

  create_table "voted_spots", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_voted_spots_on_spot_id"
    t.index ["user_id"], name: "index_voted_spots_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bait_catches", "baits"
  add_foreign_key "bait_catches", "catches"
  add_foreign_key "catch_spots", "catches"
  add_foreign_key "catch_spots", "spots"
  add_foreign_key "liked_spots", "spots"
  add_foreign_key "liked_spots", "users"
  add_foreign_key "posts", "catches"
  add_foreign_key "posts", "spots"
  add_foreign_key "posts", "users"
  add_foreign_key "verify_catch_spots", "catch_spots"
  add_foreign_key "verify_catch_spots", "users"
  add_foreign_key "voted_spots", "spots"
  add_foreign_key "voted_spots", "users"
end
