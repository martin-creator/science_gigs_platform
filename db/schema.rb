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

ActiveRecord::Schema[7.0].define(version: 2023_11_25_200137) do
  create_table "action_text_tables", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_tables", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_tables_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "comments" because of following StandardError
#   Unknown type 'uuid' for column 'order_id'

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.integer "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "title"
    t.string "video"
    t.boolean "active", default: false
    t.boolean "has_single_pricing", default: false
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_gigs_on_category_id"
    t.index ["user_id"], name: "index_gigs_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "conversation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "note"
    t.integer "amount"
    t.integer "days"
    t.integer "status", default: 0
    t.integer "request_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_offers_on_request_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "due_date"
    t.string "title"
    t.float "amount"
    t.integer "status", default: 0
    t.string "seller_name"
    t.string "buyer_name"
    t.integer "gig_id", null: false
    t.integer "buyer_id"
    t.integer "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "request_id"
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["gig_id"], name: "index_orders_on_gig_id"
    t.index ["request_id"], name: "index_orders_on_request_id"
    t.index ["seller_id"], name: "index_orders_on_seller_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "delivery_time"
    t.integer "price"
    t.integer "pricing_type"
    t.integer "gig_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gig_id"], name: "index_pricings_on_gig_id"
  end

  create_table "requests", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.integer "budget"
    t.integer "delivery"
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_requests_on_category_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

# Could not dump table "reviews" because of following StandardError
#   Unknown type 'uuid' for column 'order_id'

  create_table "subscriptions", force: :cascade do |t|
    t.string "plan_id"
    t.string "sub_id"
    t.integer "status", default: 0
    t.date "expired_at"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "status"
    t.integer "transaction_type"
    t.float "amount"
    t.integer "source_type"
    t.integer "request_id"
    t.integer "gig_id"
    t.integer "buyer_id"
    t.integer "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["gig_id"], name: "index_transactions_on_gig_id"
    t.index ["request_id"], name: "index_transactions_on_request_id"
    t.index ["seller_id"], name: "index_transactions_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "from"
    t.text "about"
    t.string "language"
    t.boolean "status"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "phone"
    t.float "wallet", default: 0.0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "orders"
  add_foreign_key "comments", "users"
  add_foreign_key "conversations", "users", column: "receiver_id"
  add_foreign_key "conversations", "users", column: "sender_id"
  add_foreign_key "gigs", "categories"
  add_foreign_key "gigs", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "offers", "requests"
  add_foreign_key "offers", "users"
  add_foreign_key "orders", "gigs"
  add_foreign_key "orders", "requests"
  add_foreign_key "orders", "users", column: "buyer_id"
  add_foreign_key "orders", "users", column: "seller_id"
  add_foreign_key "pricings", "gigs"
  add_foreign_key "requests", "categories"
  add_foreign_key "requests", "users"
  add_foreign_key "reviews", "gigs"
  add_foreign_key "reviews", "orders"
  add_foreign_key "reviews", "users", column: "buyer_id"
  add_foreign_key "reviews", "users", column: "seller_id"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "transactions", "gigs"
  add_foreign_key "transactions", "requests"
  add_foreign_key "transactions", "users", column: "buyer_id"
  add_foreign_key "transactions", "users", column: "seller_id"
end
