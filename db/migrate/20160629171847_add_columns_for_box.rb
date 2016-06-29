class AddColumnsForBox < ActiveRecord::Migration
  def change
    remove_column :boxes, :date, :integer
    add_column :boxes, :theme_title, :string
    add_column :boxes, :starts_at, :datetime
    add_column :boxes, :plan_id, :integer
  end
end
