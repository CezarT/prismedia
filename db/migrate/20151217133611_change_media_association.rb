class ChangeMediaAssociation < ActiveRecord::Migration
  def change
  	rename_column :links, :media_id, :media_outlet_id
  	change_column :media_outlets, :type,  :string
  end
end
