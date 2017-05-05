
ActiveRecord::Schema.define(version: 20170505013210) do

  create_table "advertisements", force: :cascade do |t|
    t.string   "title"
    t.text     "copy"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id"

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "resolved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsored_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "price"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sponsored_posts", ["topic_id"], name: "index_sponsored_posts_on_topic_id"

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.boolean  "public",      default: true
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
