class RemoveColumnsFromRegistration < ActiveRecord::Migration
  def change
    remove_column :registrations, :name, :string
    remove_column :registrations, :email, :string
  end
end
