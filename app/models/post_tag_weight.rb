class PostTagWeight < ActiveRecord::Base
	validates :weight, presence: true

	belongs_to :post
	belongs_to :tag
end
