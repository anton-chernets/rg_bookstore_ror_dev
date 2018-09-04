class CreateShoppingDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_deliveries do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.timestamps null: false
    end
  end
end
