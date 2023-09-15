class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])

    @new_comment = @post.comments.build(text: comment_params[:text], author_id: @user.id)
    respond_to do |format|
      format.html do
        if @new_comment.save
          redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully'
        else
          redirect_to user_post_path(current_user, @post), alert: 'Cannot create comment'
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to user_post_path(@comment.post), notice: 'Comment was successfully deleted.'
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
