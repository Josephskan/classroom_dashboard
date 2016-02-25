class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.integer  :teacher_id
      t.integer  :classroom_id
      t.text :text
      t.timestamps null: false
    end

    add_index "messages", ["classroom_id"], name: "messages_on_classroom_id"
    add_index "messages", ["teacher_id"], name: "messages_on_teacher_id"

    create_table :comments do |t|
      t.integer  :user_id
      t.integer  :message_id
      t.text :text
      t.timestamps null: false
    end
    
    add_index "comments", ["user_id"], name: "comments_on_user_id"
  end
end
