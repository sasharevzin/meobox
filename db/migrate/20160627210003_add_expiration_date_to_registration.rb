class AddExpirationDateToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :expired_at, :datetime
  end
end
