class DefaultRating < ActiveRecord::Migration
  def change
  	add_column :links, :total_votes, :integer
  	change_column :links, :rating, :integer, default: 1
  	change_column :links, :share_rating, :integer, default: 1
  end
end