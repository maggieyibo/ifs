class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :hello_title
  has_many :post_tag_weights

  def hello_title
    "Hello #{object.title}"
  end
end
