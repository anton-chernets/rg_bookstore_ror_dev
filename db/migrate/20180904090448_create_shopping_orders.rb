class CreateShoppingOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_orders do |t|
      t.integer :state, null: false

      t.integer :customer_id
      t.string :customer_type

      t.integer :delivery_id, index: true

      t.timestamps null: false
    end

    add_index :shopping_orders, :state
    add_index :shopping_orders, [:customer_id, :customer_type]
  end
end
