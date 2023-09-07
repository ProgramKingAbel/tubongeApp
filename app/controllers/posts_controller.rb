class PostsController < ApplicationController
  before_action :find_user


  def index
    @user_posts = @user.posts
  end

  def show
    @user_post = @user.posts.find_by(id: params[:id])
    @user = User.find(params[:user_id])
     @posts = @user.posts.where.not(id: @user_post.id).paginate(page: params[:page], per_page: params[:per_page] || 2)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
