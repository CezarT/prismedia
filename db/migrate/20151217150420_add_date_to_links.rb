class AddDateToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :date_published, :date
  	add_column :links, :share_rating, :integer
  	change_column :media_outlets, :type,  :integer
  end
end
