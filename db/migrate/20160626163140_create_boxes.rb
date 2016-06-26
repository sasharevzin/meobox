class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :subscription
      t.integer :date
      t.string :title

      t.timestamps null: false
    end
  end
end
