class AddBoxIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :box_id, :integer
  end
end
