class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.integer :user_id, null: false
      t.string :background_color
      t.string :font_color
      t.string :font_style
      t.string :font_size

      t.timestamps null: false
    end
  end
end
