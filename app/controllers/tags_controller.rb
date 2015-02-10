class TagsController < ApplicationController
	before_filter :authorize, :except => [:index, :show]

	def index
	  @tags = Tag.all
	  render json: @tags, each_serializer: TagSerializer
	end

	def show
	  @tag = Tag.find(params[:id])
	end

	def new
	  @tag = Tag.new
	end

	def create
	  @tag = Tag.new(tag_params)

	  if @tag.save
	  	redirect_to tags_path
	  else
	  	render :new
	  end    
	end

	def edit
	  @tag = Tag.find(params[:id])
	end

	def update
	  @tag = Tag.find(params[:id])

	  if @tag.update(tag_params)
	  	redirect_to tags_path
	  else
	  	render :edit
	  end
	end

	def tag_params
	  params.require(:tag).permit(:name)
	end

end
