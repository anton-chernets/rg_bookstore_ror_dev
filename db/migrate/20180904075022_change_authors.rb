class ChangeAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :portrait, :string
  end
end
