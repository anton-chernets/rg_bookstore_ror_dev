class CreateShoppingOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_order_items do |t|
      t.integer :quantity, null: false

      t.string :product_type, null: false
      t.integer :product_id, null: false

      t.integer :order_id, index: true, null: false

      t.timestamps null: false
    end

    add_index :shopping_order_items, [:product_type, :product_id]
  end
end
