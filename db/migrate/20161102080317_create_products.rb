class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :kind, default: 0
      t.float :price
      t.float :rating, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
