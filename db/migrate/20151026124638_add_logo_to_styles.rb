class AddLogoToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :logo, :string
  end
end
