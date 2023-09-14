require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'renders the index template and assigns @users' do
      # Simulate a GET request to the /users endpoint
      get users_path

      # Verify that the response is successful (HTTP status 200)
      expect(response).to have_http_status(200)

      # Verify that the index template is rendered
      expect(response).to render_template(:index)

      # Verify that the response body includes correct placeholder text.
      expect(response.body).to include('<title>TubongeApp</title>')
    end
  end

  describe ' Get /users/:id' do
    it 'renders the show template and assigns @user' do
      # Create a sample user for testing

      user = User.create(
        name: 'test user',
        photo: 'https://example.com/photos/0X8086XX09',
        bio: 'test_bio',
        posts_counter: 1
      )

      # Simulate a GET request to the /users/:id endpoint
      get user_path(user)

      # Verify that the response is successful (HTTP status 200)
      expect(response).to have_http_status(200)

      # Verify that the show template is rendered
      assert_template :show

      # Verify that the @user instance variable is assigned and contains the correct user
      expect(assigns(:user)).to eq(user)

      # Verify that the response body includes correct placeholder text.
      expect(response.body).to include('<h3>Bio</h3>')
    end
  end
end
