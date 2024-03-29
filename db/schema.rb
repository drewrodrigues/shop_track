# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_13_161355) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "combined_items", force: :cascade do |t|
    t.float "quantity"
    t.string "quantity_scale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "combined_id"
    t.string "itemable_type"
    t.bigint "itemable_id"
    t.index ["combined_id"], name: "index_combined_items_on_combined_id"
    t.index ["itemable_type", "itemable_id"], name: "index_combined_items_on_itemable_type_and_itemable_id"
  end

  create_table "combineds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "quantity"
    t.string "quantity_scale"
  end

  create_table "kitchen_items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "marketings", force: :cascade do |t|
    t.date "date_used"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "kitchen_item_id", null: false
    t.integer "count"
    t.float "quantity"
    t.float "price"
    t.string "quantity_scale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.bigint "category_id"
    t.string "detail"
    t.index ["category_id"], name: "index_receipts_on_category_id"
    t.index ["kitchen_item_id"], name: "index_receipts_on_kitchen_item_id"
  end

  create_table "recipe_combined_items", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "combined_id", null: false
    t.float "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combined_id"], name: "index_recipe_combined_items_on_combined_id"
    t.index ["recipe_id"], name: "index_recipe_combined_items_on_recipe_id"
  end

  create_table "recipe_items", force: :cascade do |t|
    t.bigint "receipt_id", null: false
    t.float "quantity"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receipt_id"], name: "index_recipe_items_on_receipt_id"
    t.index ["recipe_id"], name: "index_recipe_items_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "sale_price"
    t.string "scraper_sale_text_association"
  end

  create_table "recurrings", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.float "pos_sum"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "recipe_id"
    t.string "name", null: false
    t.float "discount"
    t.index ["recipe_id"], name: "index_sale_items_on_recipe_id"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "pos_datetime", null: false
    t.float "pos_total", null: false
    t.string "pos_fiscal_number", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "receipts", "kitchen_items"
  add_foreign_key "recipe_combined_items", "recipes"
  add_foreign_key "recipe_items", "receipts"
  add_foreign_key "recipe_items", "recipes"
  add_foreign_key "sale_items", "sales"
end
