class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :img
      t.string :title
      t.text :descr

      t.timestamps null: false
    end
  end
end
