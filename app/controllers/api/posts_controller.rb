class Api::PostsController < ApplicationController
    before_action :find_user

    def index
        @posts = @user.posts
        render json: @posts
      end
    private

    def find_user
      @user = User.includes(posts: :comments).find(params[:user_id])
    end
end
