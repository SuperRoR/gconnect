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

ActiveRecord::Schema.define(version: 20180615131501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "",                   null: false
    t.string   "encrypted_password",     default: "",                   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "hotel_id"
    t.string   "role",                   default: "department_manager"
    t.integer  "department_id"
    t.index ["department_id"], name: "index_admin_users_on_department_id", using: :btree
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["hotel_id"], name: "index_admin_users_on_hotel_id", using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hotel_id"
    t.index ["hotel_id"], name: "index_departments_on_hotel_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "slug"
    t.string   "wevo_pbx_local_domain"
    t.string   "wevo_pbx_remote_domain", default: "cloudpbx.gconnect.com"
    t.boolean  "use_cloud",              default: true
    t.index ["slug"], name: "index_hotels_on_slug", using: :btree
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id",               null: false
    t.integer  "product_id",             null: false
    t.integer  "amount",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "room_id"
    t.string   "status",     default: "pending", null: false
    t.index ["room_id"], name: "index_orders_on_room_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "category_id"
    t.integer  "price",                     null: false
    t.integer  "amount",        default: 0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "icon"
    t.integer  "department_id"
    t.index ["department_id"], name: "index_products_on_department_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "room_number"
    t.integer  "sub_number",                default: 0
    t.string   "status",                    default: "checkout"
    t.datetime "from"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "days",                      default: 1
    t.string   "code",                      default: ""
    t.string   "ext_phone_type1"
    t.string   "ext_no1"
    t.string   "ext_password1"
    t.string   "ext_device_token_android1"
    t.string   "ext_device_token_ios1"
    t.string   "ext_phone_type2"
    t.string   "ext_no2"
    t.string   "ext_password2"
    t.string   "ext_device_token_android2"
    t.string   "ext_device_token_ios2"
    t.index ["code"], name: "index_rooms_on_code", unique: true, using: :btree
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id", using: :btree
  end

  add_foreign_key "admin_users", "hotels"
  add_foreign_key "departments", "hotels"
  add_foreign_key "orders", "rooms"
  add_foreign_key "products", "departments"
end
