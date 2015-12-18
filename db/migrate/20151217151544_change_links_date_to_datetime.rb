class ChangeLinksDateToDatetime < ActiveRecord::Migration
  def change
  	change_column :links, :date_published, :datetime
  end
end
