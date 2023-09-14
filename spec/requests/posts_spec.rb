require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'renders the index template and assigns @user_posts' do
      # Create a sample user and associated posts for testing
      user = User.create(
        name: 'Abel Morara',
        photo: 'https://example.com/photos/0X8086XX09',
        bio: 'test_bio',
        posts_counter: 0
      )

      # Simulate a GET request to the /users/:user_id/posts endpoint
      get user_posts_path(user)

      # Verify that the response is successful (HTTP status 200)
      expect(response).to have_http_status(200)

      # Verify that the index template is rendered
      expect(response).to render_template(:index)

      # Includes correct placeholder content
      expect(response.body).to include('<p>Number of posts: 0</p>')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'renders the show template and assigns @user_post' do
      # Create a sample user and associated post for testing
      user = User.create(
        name: 'Abel Morara',
        photo: 'https://example.com/photos/0X8086XX09',
        bio: 'test_bio',
        posts_counter: 1
      )
      post = Post.create(
        author: user,
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 1,
        likes_counter: 1
      )

      # Simulate a GET request to the /users/:user_id/posts/:id endpoint
      get user_post_path(user, post)

      # Verify that the response is successful (HTTP status 200)
      expect(response).to have_http_status(200)

      # Verify that the show template is rendered
      expect(response).to render_template(:show)

      # Verify correct placeholder text
      expect(response.body).to include('<p>This is my first post</p>')
    end
  end
end
