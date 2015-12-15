class AddImagesToLinks < ActiveRecord::Migration
  def up
    add_attachment :links, :image
  end

  def down
    remove_attachment :links, :image
  end
end
