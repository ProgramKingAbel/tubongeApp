class PostsController < ApplicationController
  before_action :find_user

  def index
    @user_posts = @user.posts.includes(:comments)
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show
    @user_post = @user.posts.includes(:comments).find_by(id: params[:id])
    @user = User.includes(posts: :comments).find(params[:user_id])
    @like = Like.new
  end

  private

  def find_user
    @user = User.includes(posts: :comments).find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
