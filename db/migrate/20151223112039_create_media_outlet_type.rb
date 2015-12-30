class CreateMediaOutletType < ActiveRecord::Migration
  def change
    create_table :media_outlet_types do |t|
      t.string :name
    end
    rename_column :media_outlets, :type, :media_outlet_type
  end
end
