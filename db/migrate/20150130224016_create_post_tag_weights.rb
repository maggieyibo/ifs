class CreatePostTagWeights < ActiveRecord::Migration
  def change
    create_table :post_tag_weights do |t|
      t.integer :weight

      t.timestamps null: false
    end
  end
end
