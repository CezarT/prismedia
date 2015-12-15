class ChangeLinkTitleToString < ActiveRecord::Migration
  def change
  	change_column(:links, :title, :string)
  end
end
