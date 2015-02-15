class PostsController < ApplicationController
	before_action :authorize
	#respond_to :html, :json
	def index
	  @posts = Post.all
	  render json: @posts, each_serializer: PostSerializer
	end

	def show
	  @post = Post.find(params[:id])
	  render json: @post, serializer: PostSerializer
	end

	def new
	  @post = Post.new
	  # note: getting this via an ajax call, not erb
    # @tags = Tag.all
	end

	def create
	  @post = Post.new(post_params)
	  @tags= Tag.all

	  params[:post].tags.split(',').each do |t|
      tags << t
    end

    find_by[:ta]

	  if @post.save
	  	redirect_to posts_path
	  else
	  	render :new
	  end
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])

	  if @post.update(post_params)
	  	redirect_to posts_path
	  else
	  	render :edit
	  end
	end

	def destroy
	  @post = Post.find(params[:id])

	  if @post.destroy
        redirect_to posts_path
	  end
	end

	def post_params
	  params.require(:post).permit(:title, :body)
	end

end