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

ActiveRecord::Schema.define(version: 20170816124958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "fights", force: :cascade do |t|
    t.integer  "fight_attack_id"
    t.integer  "fight_defence_id"
    t.boolean  "fight_result"
    t.integer  "fight_coin_lost"
    t.integer  "fight_fish_lost"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "fights_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "fight_id"
    t.index ["fight_id"], name: "index_fights_users_on_fight_id", using: :btree
    t.index ["user_id"], name: "index_fights_users_on_user_id", using: :btree
  end

  create_table "homes", force: :cascade do |t|
    t.string   "home_name"
    t.string   "home_description"
    t.integer  "home_lvl"
    t.integer  "home_coins"
    t.integer  "home_period"
    t.integer  "home_last"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "home_cost"
  end

  create_table "kirtans", force: :cascade do |t|
    t.integer  "kirtan_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "mitra_id"
    t.index ["mitra_id"], name: "index_kirtans_on_mitra_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "opp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "list_id"
    t.index ["list_id"], name: "index_lists_users_on_list_id", using: :btree
    t.index ["user_id"], name: "index_lists_users_on_user_id", using: :btree
  end

  create_table "meditations", force: :cascade do |t|
    t.integer  "meditation_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "mitra_id"
    t.index ["mitra_id"], name: "index_meditations_on_mitra_id", using: :btree
  end

  create_table "mitras", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_skills", force: :cascade do |t|
    t.integer  "skill_lvl",       default: 0
    t.integer  "skill_next_cost", default: 1
    t.integer  "skill_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["skill_id"], name: "index_my_skills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_my_skills_on_user_id", using: :btree
  end

  create_table "my_things", force: :cascade do |t|
    t.integer  "things_count", default: 0
    t.integer  "thing_wear",   default: 0
    t.integer  "user_id"
    t.integer  "thing_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "thing_lvl",    default: 0
    t.index ["thing_id"], name: "index_my_things_on_thing_id", using: :btree
    t.index ["user_id"], name: "index_my_things_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "skill_name"
    t.string   "skill_description"
    t.string   "skill_effect_text"
    t.float    "skill_effect_value"
    t.integer  "skill_val"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "things", force: :cascade do |t|
    t.string   "thing_name"
    t.string   "thing_description"
    t.string   "thing_type"
    t.integer  "thing_buy_price"
    t.integer  "thing_sell_price"
    t.integer  "thing_str"
    t.integer  "thing_def"
    t.integer  "thing_dex"
    t.integer  "thing_con"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "thing_talisman_description_101"
    t.string   "thing_talisman_description"
    t.string   "thing_talisman_conditions"
    t.float    "thing_talisman_chance"
    t.integer  "thing_min_lvl"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "auth_token"
    t.string   "name"
    t.string   "race"
    t.string   "avatar"
    t.integer  "exp"
    t.integer  "lvl"
    t.integer  "hp_now"
    t.integer  "hp_rec"
    t.integer  "en_now"
    t.integer  "en_rec"
    t.integer  "skill_coins"
    t.integer  "str"
    t.integer  "def"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "wins"
    t.integer  "lose"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "vk_id"
    t.string   "vk_auth_key"
    t.string   "vk_app_user"
    t.string   "vk_refer"
    t.string   "vk_language"
    t.integer  "coins"
    t.integer  "ferma_id"
    t.string   "ferma_name"
    t.string   "ferma_description"
    t.integer  "ferma_profit"
    t.integer  "ferma_period"
    t.bigint   "u_home_last"
    t.integer  "ferma_next_cost"
    t.integer  "fish_count"
    t.integer  "fish_chance"
    t.integer  "fish_profit"
    t.bigint   "fish_last"
    t.integer  "fish_period"
    t.integer  "fish_current_profit"
    t.integer  "fight_chance"
    t.integer  "fight_opp"
    t.integer  "fish_current_exp"
    t.integer  "ferma_cycle"
    t.bigint   "ferma_first"
    t.integer  "almaz_count"
    t.integer  "warehouse_max"
    t.integer  "hp_max"
    t.bigint   "hp_last"
    t.integer  "en_max"
    t.bigint   "en_last"
    t.integer  "prof_coins"
    t.integer  "hp_cycle"
    t.integer  "en_cycle"
    t.bigint   "attack_last"
    t.integer  "attack_period"
    t.integer  "tree_lvl"
    t.integer  "tree_rec"
    t.integer  "tree_rec_next"
    t.integer  "tree_next_cost"
    t.integer  "zabor_lvl"
    t.integer  "zabor_def"
    t.integer  "zabor_def_next"
    t.integer  "zabor_next_cost"
    t.integer  "safe_lvl"
    t.bigint   "safe_buy_time"
    t.integer  "refri_lvl"
    t.bigint   "refri_buy_time"
    t.boolean  "obereg_attack"
    t.boolean  "obereg_defence"
    t.boolean  "totem_attack"
    t.boolean  "totem_defence"
    t.bigint   "obereg_attack_time"
    t.bigint   "obereg_defence_time"
    t.bigint   "totem_attack_time"
    t.bigint   "totem_defence_time"
    t.integer  "prof_fish_lvl",          default: 0
    t.integer  "prof_fish_time_need",    default: 0
    t.integer  "prof_fish_time_have",    default: 0
    t.integer  "prof_fish_time_all",     default: 0
    t.integer  "prof_fish_next_cost",    default: 0
    t.string   "prof_fish_effect"
    t.string   "prof_fish_effect_next"
    t.integer  "prof_dozor_lvl",         default: 0
    t.integer  "prof_dozor_time_need",   default: 0
    t.integer  "prof_dozor_time_have",   default: 0
    t.integer  "prof_dozor_time_all",    default: 0
    t.integer  "prof_dozor_next_cost",   default: 0
    t.string   "prof_dozor_effect"
    t.string   "prof_dozor_effect_next"
    t.integer  "prof_steal_lvl",         default: 0
    t.integer  "prof_steal_time_need",   default: 0
    t.integer  "prof_steal_time_have",   default: 0
    t.integer  "prof_steal_time_all",    default: 0
    t.integer  "prof_steal_next_cost",   default: 0
    t.string   "prof_steal_effect"
    t.string   "prof_steal_effect_next"
    t.bigint   "dozor_last_day"
    t.bigint   "dozor_start"
    t.integer  "dozor_period",           default: 0
    t.integer  "dozor_total",            default: 144
    t.integer  "dozor_max",              default: 144
    t.integer  "dozor_coins",            default: 0
    t.integer  "dozor_fish",             default: 0
    t.integer  "dozor_exp",              default: 0
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "kirtans", "mitras"
  add_foreign_key "meditations", "mitras"
  add_foreign_key "my_skills", "skills"
  add_foreign_key "my_skills", "users"
  add_foreign_key "my_things", "things"
  add_foreign_key "my_things", "users"
  add_foreign_key "posts", "users"
end
