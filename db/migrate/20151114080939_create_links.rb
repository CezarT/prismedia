class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.integer :subject_id
      t.text :text
      t.text :descr
      t.string :image
      t.integer :rating

      t.timestamps null: false
    end
  end
end
