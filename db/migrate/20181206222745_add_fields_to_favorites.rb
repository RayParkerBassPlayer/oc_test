class AddFieldsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :color, :string
    add_column :favorites, :shingle, :string

    add_index :favorites, :shingle
    add_index :favorites, :color
  end
end
