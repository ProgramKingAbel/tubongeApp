class PostsController < ApplicationController
  before_action :find_user

  def index
    @user_posts = @user.posts
  end

  def show
    @user_post = @user.posts.find_by(id: params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @new_post = Post.new
  end 

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
