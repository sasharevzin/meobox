class ChangeUidLimitOfUser < ActiveRecord::Migration
  def change
    remove_column :users, :uid, :intger
    add_column :users, :uid, :text
  end
end
