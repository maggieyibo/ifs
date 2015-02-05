class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_many :post_tag_weights, serializer: PostTagWeightSerializer
end
