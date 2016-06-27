class ChangeUidLimitOfUser < ActiveRecord::Migration
  def change
    remove_column :users, :uid, :intger
    add_column :users, :uid, :intger, limit: 8
  end
end
