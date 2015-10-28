class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.integer :user_id, null: false

      t.string :background_color
      t.string :block_height

      t.string :name_color
      t.string :name_style
      t.string :name_size

      t.string :text_color
      t.string :text_style
      t.string :text_size

      t.string :email_color
      t.string :email_style
      t.string :email_size


      t.timestamps null: false
    end
  end
end