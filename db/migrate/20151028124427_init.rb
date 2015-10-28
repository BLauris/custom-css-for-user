class Init < ActiveRecord::Migration
  def change

    enable_extension "plpgsql"

    unless ActiveRecord::Base.connection.table_exists? 'styles'
      create_table "styles", force: :cascade do |t|
        t.integer  "user_id",          null: false
        t.string   "background_color"
        t.string   "block_height"
        t.string   "name_color"
        t.string   "name_style"
        t.string   "name_size"
        t.string   "text_color"
        t.string   "text_style"
        t.string   "text_size"
        t.string   "email_color"
        t.string   "email_style"
        t.string   "email_size"
        t.datetime "created_at",       null: false
        t.datetime "updated_at",       null: false
        t.string   "logo"
        t.string   "css"
      end
    end

    unless ActiveRecord::Base.connection.table_exists? 'users'
      create_table "users", force: :cascade do |t|
        t.string   "first_name", null: false
        t.string   "last_name",  null: false
        t.string   "email",      null: false
        t.text     "text"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end
    end

  end
end