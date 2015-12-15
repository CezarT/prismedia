class AddFieldsToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :lnk, :string
  	add_column :links, :media_id, :integer
  	rename_column :links, :descr, :title
  	remove_column :links, :image, :string
  end
end
