class Api::V1::CommentsController < ApplicationController
  before_action :find_post

  def index
    # http://127.0.0.1:3000/api/v1/users/1/posts/102/comments
    @comments = @post.comments
    render json: @comments
  end

  # POST http://127.0.0.1:3000/api/v1/users/1/posts/102/comments
  def create
    @user = current_user
    @comment = @post.comments.build(comment_params.merge(author: @user))

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
