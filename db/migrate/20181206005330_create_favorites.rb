class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :ip
      t.string :url

      t.timestamps
    end

    add_index :favorites, [:ip, :url]
  end
end
