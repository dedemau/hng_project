class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.text :information
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
