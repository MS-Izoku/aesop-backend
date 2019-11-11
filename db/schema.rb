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

ActiveRecord::Schema.define(version: 2019_11_07_223526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.string "title", default: "Title"
    t.text "body", default: ""
    t.integer "story_id"
    t.integer "chapter_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
  end

  create_table "character_in_chapters", force: :cascade do |t|
    t.integer "character_id"
    t.integer "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", default: "Character Name"
    t.integer "height", default: 100
    t.integer "weight", default: 150
    t.text "biography", default: ""
    t.text "personality", default: ""
    t.integer "story_id"
    t.string "img_url", default: "https://cdn1us.denofgeek.com/sites/denofgeekus/files/styles/main_wide/public/2019/05/toy_story_4_duke_caboom_keanu_reeves.jpg?itok=adUMUrqP"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "appearance"
    t.integer "author_id"
  end

  create_table "footnotes", force: :cascade do |t|
    t.string "title", default: ""
    t.string "body", default: ""
    t.integer "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "high_concept"
    t.string "pitch", default: "You need a pitch"
  end

  create_table "user_stories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "story_id"
    t.string "role", default: "Creator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.text "bio", default: "I am a real human person"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_url"
    t.integer "current_story_id"
    t.integer "current_chapter_id"
    t.integer "current_character_id"
  end

end
