class Api::V1::PostsController < ApplicationController
  before_action :find_user

  # http://127.0.0.1:3000/api/v1/users/1/posts

  def index
    @posts = @user.posts
    render json: @posts
  end

  private

  def find_user
    @user = User.includes(posts: :comments).find(params[:user_id])
  end
end
