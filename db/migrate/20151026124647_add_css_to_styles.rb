class AddCssToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :css, :string
  end
end
