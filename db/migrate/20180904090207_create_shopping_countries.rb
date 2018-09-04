class CreateShoppingCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_countries do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    add_index :shopping_countries, :name, unique: true
  end
end
