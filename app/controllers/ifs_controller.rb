class IfsController < ApplicationController
	# the master controller for the ifs form view page
	def main
		render
	end

  def search
    puts ".........................................."
    puts params
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end

end
