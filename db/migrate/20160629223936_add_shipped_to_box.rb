class AddShippedToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :shipped, :boolean, default: false
  end
end
