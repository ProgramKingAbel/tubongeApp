class Api::V1::CommentsController < ApplicationController
  before_action :find_post

  def index
      # http://127.0.0.1:3000/api/v1/users/1/posts/102/comments
      @comments = @post.comments
      render json: @comments
    end

  # POST http://127.0.0.1:3000/api/v1/users/1/posts/102/comments

end