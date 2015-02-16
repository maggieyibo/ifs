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
	end

	def create

    # create a new blank post
	  post = Post.new(title: post_params[:title], body: post_params[:body])

    # saves a post
    if post.save

      # create empty arrays
      tag_weights = []
      tag_ids = []

      # split the submitted tags and weights with a comma
      params[:post][:tag_weights].split(',').each do |o|

        # call ids key and weights value
        key, value = o.split(/:/).map {|num| num.to_i}

        # add all keys into tag_ids array
        tag_ids << key

        # add all values into tag_weights
        tag_weights << value
      end

      # iterate through all tag ids
      tag_ids.each_with_index do |tid, i|

        # get specific tag by tag id
        t = Tag.all.find(tid)

        # create a new post_tag_weight with weight from tag_ids
        ptw = PostTagWeight.create(weight: tag_weights[i])

        # add current post to post_tag_weight
        ptw.post = post

        # add current tag to post_tag_weight
        ptw.tag = t

        # save post_tag_weight
        ptw.save

      end

      # go to the posts path page once done
      redirect_to main_path

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
	  params.require(:post).permit(:title, :body, :tag_weights)
	end

end