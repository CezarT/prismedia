class AddShareCatchToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :total_shares, :integer
  end
end
