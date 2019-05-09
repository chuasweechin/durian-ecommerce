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

ActiveRecord::Schema.define(version: 2019_05_09_154414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "creams", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "contact_number"
    t.text "delivery_comment"
    t.text "delivery_address"
    t.text "postal_code"
    t.text "unit_number"
    t.text "delivery_date"
    t.text "delivery_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "durians", force: :cascade do |t|
    t.text "name"
    t.integer "price_per_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "cream_id"
    t.bigint "sweet_id"
    t.text "image_url"
    t.index ["cream_id"], name: "index_durians_on_cream_id"
    t.index ["sweet_id"], name: "index_durians_on_sweet_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "weight_in_kg"
    t.integer "payment_amount"
    t.datetime "txn_date"
    t.text "txn_id"
    t.text "order_status"
    t.bigint "durian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "charge_id"
    t.bigint "delivery_id"
    t.index ["delivery_id"], name: "index_orders_on_delivery_id"
    t.index ["durian_id"], name: "index_orders_on_durian_id"
  end

  create_table "sweets", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
