class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.text :description
      t.text :message
      t.float :price
      t.boolean :status, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
