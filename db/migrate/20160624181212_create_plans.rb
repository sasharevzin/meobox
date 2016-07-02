class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      t.boolean :active, null: false, default: false
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end