class CommentsController < ApplicationController
  def new
    @new_post = Comment.new
  end 
end
