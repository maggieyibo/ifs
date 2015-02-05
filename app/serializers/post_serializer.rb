class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_many :post_tag_weights, serializer: PostTagWeightSerializer

  def hello_title
    "Hello #{object.title}"
  end
end
