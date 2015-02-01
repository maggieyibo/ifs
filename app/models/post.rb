class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true
	has_many :comments
	has_many :post_tag_weights
	has_many :tags, through: :post_tag_weights
end
