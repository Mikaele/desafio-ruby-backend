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

ActiveRecord::Schema.define(version: 2021_02_20_190445) do

  create_table "archives", force: :cascade do |t|
    t.string "checkhsum", null: false
    t.integer "lines", null: false
    t.string "attachment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checkhsum"], name: "index_archives_on_checkhsum", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.string "owner", null: false
    t.string "cpf", limit: 11, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "type_transaction_id", null: false
    t.integer "store_id", null: false
    t.integer "archive_id", null: false
    t.float "value", null: false
    t.string "card", null: false
    t.time "event_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["archive_id"], name: "index_transactions_on_archive_id"
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["type_transaction_id"], name: "index_transactions_on_type_transaction_id"
  end

  create_table "type_transactions", force: :cascade do |t|
    t.string "description", limit: 30, null: false
    t.string "kind", limit: 10, null: false
    t.string "sign", limit: 1, null: false
  end

  add_foreign_key "transactions", "archives"
  add_foreign_key "transactions", "stores"
  add_foreign_key "transactions", "type_transactions"
end
