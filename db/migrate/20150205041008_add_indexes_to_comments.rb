class AddIndexesToComments < ActiveRecord::Migration
  def change
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
