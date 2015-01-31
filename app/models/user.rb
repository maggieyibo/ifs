class User < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
	has_many :posts, as: :favorite_posts


	has_secure_password
end
