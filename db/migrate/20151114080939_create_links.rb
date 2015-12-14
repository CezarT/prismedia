class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :user
      t.belongs_to :timeline
      t.text :text
      t.text :descr
      t.string :image
      t.integer :rating

      t.timestamps null: false
    end
  end
end
