class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :votes_score
end
