class ChangeColumnsForBox < ActiveRecord::Migration
  def change
    remove_column :boxes, :subscription, :string
    remove_column :boxes, :date, :integer
    add_column :boxes, :month, :integer
    add_column :boxes, :plan_id, :integer
  end
end
