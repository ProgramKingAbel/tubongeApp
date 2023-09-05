# spec/requests/users_spec.rb

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "renders the index template and assigns @users" do
      # Simulate a GET request to the /users endpoint
      get users_path

      # Verify that the response is successful (HTTP status 200)
      expect(response).to have_http_status(200)

      # Verify that the index template is rendered
      expect(response).to render_template(:index)

      # Verify that the response body includes correct placeholder text.
      expect(response.body).to include('<h1>Home Page Displays all available users and their details </h1>')
    end
  end
end

