class Tag < ActiveRecord::Base
	validates :name, presence: true
	has_many :posts, through: :post_tag_weight

end
