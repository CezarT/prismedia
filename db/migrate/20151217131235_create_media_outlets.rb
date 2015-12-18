class CreateMediaOutlets < ActiveRecord::Migration
  def change
    create_table :media_outlets do |t|
      t.string :title
      t.string :url
      t.integer :type

      t.timestamps null: false
    end
  end
end
