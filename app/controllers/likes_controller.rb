class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = @post.likes.build(author_id: current_user.id)
    if @like.save
      redirect_to user_post_path(current_user, @post), notice: 'Post liked'
    else
      redirect_to user_post_path(current_user, @post), notice: 'Post Cannot be liked'
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
