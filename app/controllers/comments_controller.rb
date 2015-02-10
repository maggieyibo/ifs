class CommentsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to comments_path
    else
      render :new
    end    
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :votes_score)
  end
end
