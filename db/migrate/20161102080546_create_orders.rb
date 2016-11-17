class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :cost
      t.boolean :is_accept, default: false
      t.boolean :is_confirm, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
