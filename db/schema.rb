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

ActiveRecord::Schema.define(version: 2020_02_18_235225) do

  create_table "cart_lines", force: :cascade do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.integer "quantity", default: 0, null: false
    t.decimal "price", precision: 4, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_lines_on_cart_id"
    t.index ["product_id", "cart_id"], name: "index_cart_lines_on_product_id_and_cart_id"
    t.index ["product_id"], name: "index_cart_lines_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal "total", precision: 4, scale: 2, default: "0.0", null: false
    t.datetime "expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 4, scale: 2
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
