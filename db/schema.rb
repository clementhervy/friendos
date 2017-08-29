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

ActiveRecord::Schema.define(version: 20170829112630) do

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_expenditures", id: false, force: :cascade do |t|
    t.integer "categories_id"
    t.integer "expenditures_id"
    t.index ["categories_id"], name: "index_categories_expenditures_on_categories_id"
    t.index ["expenditures_id"], name: "index_categories_expenditures_on_expenditures_id"
  end

  create_table "expenditures", force: :cascade do |t|
    t.string "object"
    t.datetime "date_made"
    t.integer "payer_id"
    t.integer "group_id"
    t.integer "amount_cents"
    t.boolean "is_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_expenditures_on_group_id"
    t.index ["payer_id"], name: "index_expenditures_on_payer_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "groups_id"
    t.integer "users_id"
    t.index ["groups_id"], name: "index_groups_users_on_groups_id"
    t.index ["users_id"], name: "index_groups_users_on_users_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "expenditure_id"
    t.datetime "date_made"
    t.integer "payer_id"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expenditure_id"], name: "index_payments_on_expenditure_id"
    t.index ["payer_id"], name: "index_payments_on_payer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
