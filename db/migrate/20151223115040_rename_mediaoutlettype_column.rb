class RenameMediaoutlettypeColumn < ActiveRecord::Migration
  def change
  	rename_column :media_outlets, :media_outlet_type, :media_outlet_type_id
  end
end
