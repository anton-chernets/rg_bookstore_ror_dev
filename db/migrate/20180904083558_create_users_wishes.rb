class CreateUsersWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :users_wishes, id: false do |t|
      t.belongs_to :user
      t.belongs_to :book
    end

    add_index :users_wishes, [:user_id, :book_id]
  end
end
