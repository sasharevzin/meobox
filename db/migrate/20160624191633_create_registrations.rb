class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.references :plan, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
