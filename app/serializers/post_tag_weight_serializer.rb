class PostTagWeightSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight, :tag_id, :post_id

  def name
    object.tag.name
  end
end
