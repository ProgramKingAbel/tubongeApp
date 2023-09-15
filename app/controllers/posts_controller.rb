class PostsController < ApplicationController
  before_action :find_user

  def index
    @user_posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = User.includes(posts: :comments).find(params[:user_id])
    @user_post = @user.posts.includes(:comments).find_by(id: params[:id])
    @like = Like.new
  end

  def destroy
    @user = User.includes(posts: :comments).find(params[:user_id])
    @user_post = @user.posts.includes(:comments).find_by(id: params[:id])
    @user_post.destroy
    redirect_to user_posts_path(@user), status: :see_other
  end

  private

  def find_user
    @user = User.includes(posts: :comments).find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
