class CreateZips < ActiveRecord::Migration[5.2]
  def change
    create_table :zips, :id => false, :primary_key => true  do |t|
      t.string :code
    end
  end
end
