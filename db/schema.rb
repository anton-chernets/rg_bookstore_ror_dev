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

ActiveRecord::Schema.define(version: 2018_09_04_091504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "portrait"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "cover"
    t.text "short_description"
    t.text "full_description"
    t.float "price"
    t.integer "average_rating", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "note", null: false
    t.integer "rating", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["status"], name: "index_reviews_on_status"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shopping_addresses", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "street", null: false
    t.string "city", null: false
    t.string "zip", null: false
    t.string "phone", null: false
    t.integer "addressable_id"
    t.string "addressable_type"
    t.string "type"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_id", "addressable_type", "type"], name: "address_addressable_id_addressable_type_type"
    t.index ["country_id"], name: "index_shopping_addresses_on_country_id"
  end

  create_table "shopping_countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shopping_countries_on_name", unique: true
  end

  create_table "shopping_credit_cards", force: :cascade do |t|
    t.string "number", null: false
    t.integer "expiration_month", null: false
    t.integer "expiration_year", null: false
    t.integer "cvv", null: false
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_credit_cards_on_order_id"
  end

  create_table "shopping_deliveries", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_order_items", force: :cascade do |t|
    t.integer "quantity", null: false
    t.string "product_type", null: false
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_order_items_on_order_id"
    t.index ["product_type", "product_id"], name: "index_shopping_order_items_on_product_type_and_product_id"
  end

  create_table "shopping_orders", force: :cascade do |t|
    t.integer "state", null: false
    t.integer "customer_id"
    t.string "customer_type"
    t.integer "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "customer_type"], name: "index_shopping_orders_on_customer_id_and_customer_type"
    t.index ["delivery_id"], name: "index_shopping_orders_on_delivery_id"
    t.index ["state"], name: "index_shopping_orders_on_state"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_wishes", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_users_wishes_on_book_id"
    t.index ["user_id", "book_id"], name: "index_users_wishes_on_user_id_and_book_id"
    t.index ["user_id"], name: "index_users_wishes_on_user_id"
  end

  create_table "wishes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_wishes_on_book_id"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "categories"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
  add_foreign_key "wishes", "books"
  add_foreign_key "wishes", "users"
end
