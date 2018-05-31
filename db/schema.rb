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

ActiveRecord::Schema.define(version: 20180531031218) do

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
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "hotel_id"
    t.boolean  "is_super_admin",         default: false
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
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
    t.string   "status",     default: "PENDING", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "room_id"
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
    t.integer  "sub_number",  default: 1
    t.string   "status",      default: "checkout"
    t.datetime "from"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "days",        default: 1
    t.string   "code",        default: ""
    t.index ["code"], name: "index_rooms_on_code", unique: true, using: :btree
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id", using: :btree
  end

  create_table "wevo_devices", force: :cascade do |t|
    t.integer  "wevo_user_id",                             null: false
    t.string   "device_type"
    t.string   "device_token"
    t.string   "acc_uname"
    t.string   "acc_secret"
    t.string   "acc_auth"
    t.string   "acc_transport"
    t.string   "acc_proxy"
    t.string   "acc_proxy_enable",           default: "0"
    t.string   "acc_reg_expire"
    t.string   "acc_prefix"
    t.string   "acc_avpf_enable",            default: "0"
    t.string   "acc_avpf_interval"
    t.string   "acc_plus_00"
    t.string   "acc_disableac"
    t.string   "audio_eco_can_enable"
    t.string   "audio_adp_rate_enable"
    t.string   "audio_codec_rate_lim"
    t.string   "audio_codec"
    t.string   "video_enable"
    t.string   "video_always_initiate"
    t.string   "video_always_accept"
    t.string   "video_preset"
    t.string   "video_size"
    t.string   "video_overlay"
    t.string   "video_codec"
    t.string   "call_use_internal_ringtone"
    t.string   "call_media_encryption"
    t.string   "call_dtmf_sipinfo_enable"
    t.string   "call_dtmf_rfc2833_enable"
    t.string   "call_auto_answer_enable"
    t.string   "call_vm_uri"
    t.string   "chat_encrypt_enable"
    t.string   "chat_share_server"
    t.string   "net_wifi_only"
    t.string   "net_dmode_enable"
    t.string   "net_stun_turn_server"
    t.string   "net_ice_enable"
    t.string   "net_turn_enable"
    t.string   "net_stun_turn_uname"
    t.string   "net_stun_turn_pass"
    t.string   "net_rnd_ports_enable"
    t.string   "net_sip_port"
    t.string   "net_push_notify_enable"
    t.string   "net_ipv6_allow"
    t.string   "adv_flist_subs_enable"
    t.string   "adv_bg_enable"
    t.string   "adv_svc_notify_enable"
    t.string   "adv_boot_start"
    t.string   "adv_pa_dname"
    t.string   "adv_pa_uname"
    t.string   "device_token2"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "wevo_users", force: :cascade do |t|
    t.integer  "wevo_server_id"
    t.string   "email",                                null: false
    t.string   "user_display_name"
    t.string   "phone_number",                         null: false
    t.boolean  "is_verified",          default: false, null: false
    t.string   "extension"
    t.string   "auth_token"
    t.string   "wevopbx_domain"
    t.string   "wevopbx_local_domain"
    t.string   "remember_token"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "room_id"
    t.index ["room_id"], name: "index_wevo_users_on_room_id", using: :btree
  end

  add_foreign_key "admin_users", "hotels"
  add_foreign_key "departments", "hotels"
  add_foreign_key "orders", "rooms"
  add_foreign_key "products", "departments"
  add_foreign_key "wevo_users", "rooms"
end
