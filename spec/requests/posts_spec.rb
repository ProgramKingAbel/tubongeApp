require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /users/:user_id/posts" do
    it "renders the index template and assigns @user_posts" do
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
      expect(response.body).to include('<h1> Implement all posts for associated to a specific user</h1>')
    end
  end
end

