ActiveRecord::Schema.define(version: 1) do

    enable_extension "plpgsql"
  
    create_table "users", force: :cascade do |t|
        t.string "email", default: "", null: false
        t.string "name", default: "", null: false
        t.string "password_digest", default: "", null: false
    end
  
    create_table "posts", force: :cascade do |t|
        t.string "title"
        t.string "text"
        t.bigint "user_id"
        t.index ["user_id"], name: "index_posts_on_user_id"
    end
  
    create_table "comments", force: :cascade do |t|
        t.string "name"
        t.string "observation"
        t.bigint "post_id"
        t.index ["post_id"], name: "index_comments_on_user_id"
    end
  
    add_foreign_key "posts", "users"
    add_foreign_key "comments", "posts"

end
  