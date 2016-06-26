class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :size
      t.string :url

      t.timestamps null: false
    end
  end
end
