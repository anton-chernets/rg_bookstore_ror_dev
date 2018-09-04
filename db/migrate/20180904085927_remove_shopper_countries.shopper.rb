class RemoveShopperCountries < ActiveRecord::Migration[5.2]
  def  up
    drop_table :shopper_countries
  end
end
