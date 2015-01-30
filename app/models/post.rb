class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true

	has_many :comments
	has_many :tags, through: :post_tag_weight

end
