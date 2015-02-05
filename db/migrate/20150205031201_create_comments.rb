class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.integer :votes_score

      t.timestamps null: false
    end
  end
end
