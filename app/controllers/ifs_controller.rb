class IfsController < ApplicationController
	# the master controller for the ifs form view page
	def main
		render
	end

  def search
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end
end
