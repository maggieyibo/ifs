class AddReferencesToPostTagWeightTable < ActiveRecord::Migration
  def change
  	add_reference :post_tag_weights, :post, index: true
  	add_reference :post_tag_weights, :tag, index: true
  end
end
