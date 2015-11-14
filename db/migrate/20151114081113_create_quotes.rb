class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :link_id
      t.string :user_id
      t.string :q

      t.timestamps null: false
    end
  end
end
