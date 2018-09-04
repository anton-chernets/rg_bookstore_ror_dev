class ChangeCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :slug
  end
end
