class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @user_posts = @user.posts.all
  end

  def show
    @user_post = @user.posts.find[:id])
  end
end 
