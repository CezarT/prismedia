class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.references :user
      t.string :img
      t.string :title
      t.text :descr

      t.timestamps null: false
    end
  end
end